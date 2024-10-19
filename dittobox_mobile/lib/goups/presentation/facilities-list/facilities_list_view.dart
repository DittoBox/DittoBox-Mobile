import 'package:dittobox_mobile/goups/infrastructure/models/facilities.dart';
import 'package:dittobox_mobile/goups/presentation/widgets/add_facilities_sheet.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/widgets/custom_navigator_drawer.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/goups/presentation/widgets/facility_details_sheet.dart'; // Importa el archivo
import 'package:dittobox_mobile/goups/infrastructure/data_sources/facilities_service.dart'; // Importa el servicio

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
        title: const Text('Facilities'),
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
  final FacilitiesService _facilitiesService = FacilitiesService(); // Instancia del servicio

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
      final facilities = await _facilitiesService.getFacilities();
      setState(() {
        _facilities = facilities;
        _filteredFacilities = facilities;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to fetch facilities: $e'),
        ),
      );
    }
  }

  void _filterFacilities() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredFacilities = _facilities.where((facility) {
        return facility.title.toLowerCase().contains(query) ||
            facility.location.toLowerCase().contains(query);
      }).toList();
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
                labelText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return FacilitiesCard(facility: _filteredFacilities[index]);
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

  const FacilitiesCard({super.key, required this.facility});

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
        showFacilityDetailsBottomSheet(context, widget.facility); // Usa el nuevo archivo
      },
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.black, width: 1),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
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
                      child: buildInfoRowWithIcon(Icons.widgets_outlined, 'Containers', widget.facility.containers),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: buildInfoRowWithIcon(Icons.notifications_none_outlined, 'Alerts', widget.facility.alerts),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: buildInfoRowWithIcon(Icons.person_2_outlined, 'Workers', widget.facility.workers),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () {
                      showFacilityDetailsBottomSheet(context, widget.facility); // Usa el nuevo archivo
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('More'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}