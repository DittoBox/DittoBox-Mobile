import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/goups/infrastructure/models/facilities.dart';
import 'package:dittobox_mobile/goups/presentation/widgets/add_facilities_sheet.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/widgets/custom_navigator_drawer.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/goups/presentation/widgets/facility_details_sheet.dart';
import 'package:dittobox_mobile/goups/infrastructure/data_sources/facilities_service.dart';

// Facilities List Screen
class FacilitiesListScreen extends StatefulWidget {
  const FacilitiesListScreen({super.key});

  @override
  State<FacilitiesListScreen> createState() => _FacilitiesListScreenState();
}

class _FacilitiesListScreenState extends State<FacilitiesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).facilities),
      ),
      drawer: const CustomNavigationDrawer(currentRoute: AppRoutes.facilities),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: FacilitiesList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddFacilitySheet(
              context); // Muestra el BottomSheet cuando se presiona el botón
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Facilities List Widget
class FacilitiesList extends StatefulWidget {
  const FacilitiesList({super.key});

  @override
  State<FacilitiesList> createState() => _FacilitiesListState();
}

class _FacilitiesListState extends State<FacilitiesList> {
  List<Facility> _facilities = [];
  List<Facility> _filteredFacilities = [];
  final TextEditingController _searchController = TextEditingController();
  bool _showAll = true;
  bool _showWarehouse = true;
  bool _showRestaurant = true;
  bool _isLoading = true; // Añadir variable de estado de carga

  @override
  void initState() {
    super.initState();
    _fetchFacilities();
    _searchController.addListener(_filterFacilities);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchFacilities() async {
    try {
      final facilities = await FacilitiesService().getFacilities();
      setState(() {
        _facilities = facilities;
        _filteredFacilities = facilities;
        _isLoading = false; // Actualizar estado de carga
      });
    } catch (e) {
      setState(() {
        _isLoading = false; // Actualizar estado de carga
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${S.of(context).failedToFetchFacilities}: $e'),
        ),
      );
    }
  }

  void _filterFacilities() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredFacilities = _facilities.where((facility) {
        final matchesQuery = facility.title.toLowerCase().contains(query) ||
            facility.location.city!.toLowerCase().contains(query);
        final matchesType = _showAll ||
            (facility.facilityType == 1 && _showWarehouse) ||
            (facility.facilityType == 0 && _showRestaurant);
        return matchesQuery && matchesType;
      }).toList();
    });
  }

  void _deleteFacility(Facility facility) {
    setState(() {
      _facilities.remove(facility);
      _filteredFacilities.remove(facility);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: S.of(context).search,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FilterChip(
                  label: Text(S.of(context).all),
                  selected: _showAll,
                  onSelected: (bool selected) {
                    setState(() {
                      _showAll = selected;
                      if (_showAll) {
                        _showWarehouse = false;
                        _showRestaurant = false;
                      }
                      _filterFacilities();
                    });
                  },
                ),
                const SizedBox(width: 10),
                FilterChip(
                  label: Text(S.of(context).warehouse),
                  selected: _showWarehouse,
                  onSelected: (bool selected) {
                    setState(() {
                      _showWarehouse = selected;
                      if (_showWarehouse || _showRestaurant) {
                        _showAll = false;
                      }
                      _filterFacilities();
                    });
                  },
                ),
                const SizedBox(width: 10),
                FilterChip(
                  label: Text(S.of(context).restaurant),
                  selected: _showRestaurant,
                  onSelected: (bool selected) {
                    setState(() {
                      _showRestaurant = selected;
                      if (_showWarehouse || _showRestaurant) {
                        _showAll = false;
                      }
                      _filterFacilities();
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator()) // Mostrar indicador de progreso
                : _filteredFacilities.isEmpty
                    ? Center(
                        child: Text(
                          S.of(context).noFacilitiesFound,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      )
                    : CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return FacilitiesCard(
                                  facility: _filteredFacilities[index],
                                  onDelete: () =>
                                      _deleteFacility(_filteredFacilities[index]),
                                );
                              },
                              childCount: _filteredFacilities.length,
                            ),
                          ),
                        ],
                      ),
          ),
        ],
      ),
    );
  }
}

// Facilities Card Widget
class FacilitiesCard extends StatefulWidget {
  final Facility facility;
  final VoidCallback onDelete;

  const FacilitiesCard({super.key, required this.facility, required this.onDelete});

  @override
  State<FacilitiesCard> createState() => _FacilitiesCardState();
}

class _FacilitiesCardState extends State<FacilitiesCard> {
  late Future<int> _notificationCount;

  @override
  void initState() {
    super.initState();
    _notificationCount = FacilitiesService().countNotificationsByGroupId(widget.facility.id);
    print('Facility ID: ${widget.facility.id}');
    _notificationCount.then((count) {
      print('Facilities List - Notificaciones recibidas: $count');
    });
  }

  IconData getFacilityIcon(String type) {
    switch (type) {
      case 'restaurant':
        return Icons.restaurant;
      case 'warehouse':
        return Icons.warehouse_outlined;
      default:
        return Icons.help_outline; // Icono por defecto
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showFacilityDetailsBottomSheet(context, widget.facility, widget.onDelete);
      },
      child: Center(
        child: Card.outlined(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.facility.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(widget.facility.location.city ?? ''),
                      ],
                    ),
                    Icon(getFacilityIcon(widget.facility.facilityType == 0 ? 'restaurant' : 'warehouse')),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: buildInfoRowWithIcon(Icons.widgets_outlined, S.of(context).containers, widget.facility.containerCount),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FutureBuilder<int>(
                        future: _notificationCount,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return buildInfoRowWithIcon(Icons.notifications_none_outlined, S.of(context).alerts, 0);
                          } else if (snapshot.hasError) {
                            return buildInfoRowWithIcon(Icons.notifications_none_outlined, S.of(context).alerts, 0);
                          } else {
                            return buildInfoRowWithIcon(Icons.notifications_none_outlined, S.of(context).alerts, snapshot.data ?? 0);
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: buildInfoRowWithIcon(Icons.person_2_outlined, S.of(context).workers, widget.facility.profileCount),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        showFacilityDetailsBottomSheet(context, widget.facility, widget.onDelete);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(S.of(context).more),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildInfoRowWithIcon(IconData icon, String label, int value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
      Text('$value'),
    ],
  );
}