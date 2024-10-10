import 'package:dittobox_mobile/goups/models/facilities.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/widgets/custom_navigator_drawer.dart';
import 'package:flutter/material.dart';

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
      drawer: CustomNavigationDrawer(currentRoute: AppRoutes.facilities),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
          // Acción del botón
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
  final List<Facility> _facilities = [
    Facility(
      title: 'Gran Vía',
      location: 'Madrid, Spain',
      containers: 24,
      alerts: 3,
      workers: 8,
    ),
    Facility(
      title: 'Atocha',
      location: 'Madrid, Spain',
      containers: 24,
      alerts: 3,
      workers: 8,
    ),
    Facility(
      title: 'Polígono Este',
      location: 'Madrid, Spain',
      containers: 24,
      alerts: 3,
      workers: 8,
    ),
  ];

  List<Facility> _filteredFacilities = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredFacilities = _facilities;
    _searchController.addListener(_filterFacilities);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
                prefixIcon: Icon(Icons.search),
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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showFacilityDetailsBottomSheet(context, widget.facility);
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
                    const Icon(Icons.restaurant), // Icono agregado en la parte superior derecha
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: _buildInfoRowWithIcon(Icons.widgets_outlined, 'Containers', widget.facility.containers),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: _buildInfoRowWithIcon(Icons.notifications_none_outlined, 'Alerts', widget.facility.alerts),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: _buildInfoRowWithIcon(Icons.person_2_outlined, 'Workers', widget.facility.workers),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () {
                      _showFacilityDetailsBottomSheet(context, widget.facility);
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

  void _showFacilityDetailsBottomSheet(BuildContext context, Facility facility) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Indicador de deslizamiento (handle)
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Color del indicador
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Encabezado del BottomSheet
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    facility.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'restaurant',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Contenido del BottomSheet
              _buildInfoRowWithIcon(Icons.widgets_outlined, 'Containers', facility.containers),
              TextButton(
                onPressed: () {},
                child: const Text('Add containers'),
              ),
              const SizedBox(height: 8),

              _buildInfoRowWithIcon(Icons.person_2_outlined, 'Workers', facility.workers),
              TextButton(
                onPressed: () {},
                child: const Text('Add workers'),
              ),
              const SizedBox(height: 8),

              _buildInfoRowWithIcon(Icons.notifications_none_outlined, 'Pending Alerts', facility.alerts),
              TextButton(
                onPressed: () {},
                child: const Text('Check alerts'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoRowWithIcon(IconData icon, String label, int value) {
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
}