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

class ContainerListScreen extends StatefulWidget {
  const ContainerListScreen({super.key});

  @override
  State<ContainerListScreen> createState() => _ContainerListScreenState();
}

class _ContainerListScreenState extends State<ContainerListScreen> with SingleTickerProviderStateMixin {
  List<model.Container> _containers = [];
  late TabController _tabController;
  final ContainerService _containerService = ContainerService();
  final FacilitiesService _facilitiesService = FacilitiesService();
  List<Facility> _facilities = [];
  List<int> selectedFacilityIds = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchFacilities().then((_) {
      _fetchContainers(); // Fetch all containers initially
    });
  }

  Future<void> _fetchContainers() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<model.Container> containers = [];
      if (selectedFacilityIds.isEmpty) {
        containers = await _containerService.getContainersByAccountId();
      } else {
        for (int facilityId in selectedFacilityIds) {
          containers.addAll(await _containerService.getContainersByFacilityId(facilityId));
        }
      }
      setState(() {
        _containers = containers;
      });
    } catch (e) {
      // Manejo de errores
      print('Error fetching containers: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
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

    return filteredContainers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Containers'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Column(
            children: [
              _buildFacilityChips(),
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'All'),
                  Tab(text: 'Active'),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: const CustomNavigationDrawer(currentRoute: AppRoutes.containers),
      body: Column(
        children: [
          if (_isLoading)
            const LinearProgressIndicator(),
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
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: FilterChip(
              label: Text(S.of(context).allContainers),
              selected: selectedFacilityIds.isEmpty,
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    selectedFacilityIds.clear();
                    _fetchContainers(); // Fetch all containers
                  }
                });
              },
            ),
          ),
          ..._facilities.map((facility) {
            final isSelected = selectedFacilityIds.contains(facility.id);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: FilterChip(
                label: Text(facility.title),
                selected: isSelected,
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      selectedFacilityIds.add(facility.id);
                    } else {
                      selectedFacilityIds.remove(facility.id);
                    }
                    _fetchContainers(); // Fetch containers for the selected facilities
                  });
                },
              ),
            );
          }).toList(),
        ],
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
      builder: (context) => ContainerBottomSheet(
        container: container,
        onTemplateAssigned: () {
          Navigator.of(context).pop(); // Close the bottom sheet
          _showSuccessDialog(context);
        },
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).success),
          content: Text(S.of(context).templateAssignedSuccessfully),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the success dialog
                _fetchContainers(); // Reload the container list
              },
              child: Text(S.of(context).ok),
            ),
          ],
        );
      },
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