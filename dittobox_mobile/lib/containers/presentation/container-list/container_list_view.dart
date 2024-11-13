import 'package:dittobox_mobile/containers/infrastructure/data_sources/container_service.dart';
import 'package:dittobox_mobile/containers/infrastructure/models/container.dart' as model;
import 'package:dittobox_mobile/containers/presentation/widgets/container_button_sheet.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/widgets/custom_navigator_drawer.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/goups/infrastructure/models/facilities.dart';
import 'package:dittobox_mobile/goups/infrastructure/data_sources/facilities_service.dart';
import 'package:dittobox_mobile/containers/presentation/widgets/add_container_sheet.dart';

// Container List Screen
class ContainerListScreen extends StatefulWidget {
  const ContainerListScreen({super.key});

  @override
  State<ContainerListScreen> createState() => _ContainerListScreenState();
}
class _ContainerListScreenState extends State<ContainerListScreen>
    with SingleTickerProviderStateMixin {
  List<model.Container> _containers = [];
  late TabController _tabController;
  final ContainerService _containerService = ContainerService();
  final FacilitiesService _facilitiesService = FacilitiesService();
  List<Facility> _facilities = [];
  List<String> selectedFacilities = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchContainers();
    _fetchFacilities();
  }

  Future<void> _fetchContainers() async {
    try {
      final containers = await _containerService.getContainersByAccountId();
      setState(() {
        _containers = containers;
      });
    } catch (e) {
      // Manejo de errores
      print('Error fetching containers: $e');
    }
  }

  Future<void> _fetchFacilities() async {
    try {
      final facilities = await _facilitiesService.getFacilities();
      setState(() {
        _facilities = facilities;
      });
    } catch (e) {
      // Manejo de errores
      print('Error fetching facilities: $e');
    }
  }

  List<model.Container> _getFilteredContainers(bool showActive) {
    List<model.Container> filteredContainers = _containers;

    if (showActive) {
      filteredContainers = filteredContainers
          .where((container) => container.lastKnownContainerStatus == 'Active')
          .toList();
    }

    if (selectedFacilities.isNotEmpty) {
      filteredContainers = filteredContainers
          .where((container) => selectedFacilities.contains(container.facilityId))
          .toList();
    }

    return filteredContainers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Containers'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Active'),
          ],
        ),
      ),
      drawer: const CustomNavigationDrawer(currentRoute: AppRoutes.containers),
      body: Column(
        children: [
          _buildFacilityChips(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildContainerList(_getFilteredContainers(false)),
                _buildContainerList(_getFilteredContainers(true)),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_facilities.isNotEmpty) {
            showAddContainerSheet(context, _facilities.first);
          } else {
            // Manejar el caso en que no hay instalaciones disponibles
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(S.of(context).noFacilitiesAvailable)),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildFacilityChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: _facilities.map((facility) {
          final isSelected = selectedFacilities.contains(facility.id);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: FilterChip(
              label: Text(facility.title),
              selected: isSelected,
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    selectedFacilities.add(facility.id);
                  } else {
                    selectedFacilities.remove(facility.id);
                  }
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContainerList(List<model.Container> containers) {
    if (containers.isEmpty) {
      return Center(
        child: Text(
          S.of(context).containersNotFound,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: containers.length,
        itemBuilder: (context, index) {
          return ContainerCard(
            container: containers[index],
            onTap: () => showContainerBottomSheet(context, containers[index]),
          );
        },
      ),
    );
  }

  void showContainerBottomSheet(BuildContext context, model.Container container) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => ContainerBottomSheet(container: container),
    );
  }
}

// Container Card Widget
class ContainerCard extends StatelessWidget {
  final model.Container container;
  final VoidCallback onTap;

  const ContainerCard({super.key, required this.container, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card.outlined(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                container.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.thermostat_outlined, size: 20),
                      const SizedBox(width: 8),
                      Text(S.of(context).temperature),
                    ],
                  ),
                  Text(container.temperature?.toString() ?? '--'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.water_drop_outlined, size: 20),
                      const SizedBox(width: 8),
                      Text(S.of(context).humidity),
                    ],
                  ),
                  Text(container.humidity?.toString() ?? '--'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.hourglass_empty, size: 20),
                      const SizedBox(width: 8),
                      Text(S.of(context).lastSync),
                    ],
                  ),
                  Text(container.lastSync.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}