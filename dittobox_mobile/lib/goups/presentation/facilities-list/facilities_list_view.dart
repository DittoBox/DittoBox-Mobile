import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/goups/infrastructure/models/facilities.dart';
import 'package:dittobox_mobile/goups/presentation/widgets/add_facilities_sheet.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/widgets/custom_navigator_drawer.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/goups/presentation/widgets/facility_details_sheet.dart'; // Importa el archivo

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
          showAddFacilitySheet(context); // Muestra el BottomSheet cuando se presiona el botón
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
      // Datos provisionales
      final facilities = [
        Facility(
          title: 'Restaurante A',
          location: 'Ubicación A',
          type: 'restaurant',
          containers: 10,
          alerts: 2,
          workers: 5,
        ),
        Facility(
          title: 'Almacén C',
          location: 'Ubicación B',
          type: 'warehouse',
          containers: 20,
          alerts: 1,
          workers: 8,
        ),
      ];
      setState(() {
        _facilities = facilities;
        _filteredFacilities = facilities;
      });
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          // ignore: use_build_context_synchronously
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
            facility.location.toLowerCase().contains(query);
        final matchesType = _showAll ||
            (facility.type == 'warehouse' && _showWarehouse) ||
            (facility.type == 'restaurant' && _showRestaurant);
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
               // Alinea los chips a la izquierda
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
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return FacilitiesCard(
                        facility: _filteredFacilities[index],
                        onDelete: () => _deleteFacility(_filteredFacilities[index]),
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

// Facility Card Widget
class FacilitiesCard extends StatefulWidget {
  final Facility facility;
  final VoidCallback onDelete;

  const FacilitiesCard({super.key, required this.facility, required this.onDelete});

  @override
  State<FacilitiesCard> createState() => _FacilitiesCardState();
}

class _FacilitiesCardState extends State<FacilitiesCard> {
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
        showFacilityDetailsBottomSheet(context, widget.facility, widget.onDelete); // Usa el nuevo archivo
      },
      child: Center(
        child: Card.outlined(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Ajusta el margen horizontal a 0
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
                        Text(widget.facility.location),
                      ],
                    ),
                    Icon(getFacilityIcon(widget.facility.type)), // Icono dinámico
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: buildInfoRowWithIcon(Icons.widgets_outlined, S.of(context).containers, widget.facility.containers),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: buildInfoRowWithIcon(Icons.notifications_none_outlined, S.of(context).alerts, widget.facility.alerts),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: buildInfoRowWithIcon(Icons.person_2_outlined, S.of(context).workers, widget.facility.workers),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end, // Mueve el botón al extremo derecho
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        showFacilityDetailsBottomSheet(context, widget.facility, widget.onDelete); // Usa el nuevo archivo
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
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alinea los elementos a los extremos
    children: [
      Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
      Text('$value'), // Mueve el valor al extremo derecho
    ],
  );
}