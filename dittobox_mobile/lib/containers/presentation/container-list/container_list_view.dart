import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/widgets/custom_navigator_drawer.dart';
import 'package:flutter/material.dart';

// Container List Screen
class ContainerListScreen extends StatefulWidget {
  const ContainerListScreen({super.key});

  @override
  State<ContainerListScreen> createState() => _ContainerListScreenState();
}

class _ContainerListScreenState extends State<ContainerListScreen> with SingleTickerProviderStateMixin {
  List<ContainerItem> _containers = [];
  List<ContainerItem> _filteredContainers = [];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchContainers();
  }

  Future<void> _fetchContainers() async {
    // Datos provisionales
    final containers = [
      ContainerItem(title: 'Beef and tenderloin', status: 'Active', temperature: '4°C', humidity: '48%', lastSync: '1 minute ago'),
      ContainerItem(title: 'Frozen cod', status: 'Active', temperature: '0°C', humidity: '15%', lastSync: '2 minutes ago'),
      ContainerItem(title: 'Smoked salmon', status: 'Idle', temperature: '--°C', humidity: '--%', lastSync: 'Last connection'),
    ];

    setState(() {
      _containers = containers;
      _filteredContainers = containers;
    });
  }

  List<ContainerItem> _getFilteredContainers(bool showActive) {
    if (showActive) {
      return _containers.where((container) => container.status == 'Active').toList();
    }
    return _containers;
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
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildContainerList(_getFilteredContainers(false)),
          _buildContainerList(_getFilteredContainers(true)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Agregar lógica de agregar nuevo contenedor
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildContainerList(List<ContainerItem> containers) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: containers.length,
        itemBuilder: (context, index) {
          return ContainerCard(container: containers[index]);
        },
      ),
    );
  }
}

// Container Item Model
class ContainerItem {
  final String title;
  final String status;
  final String temperature;
  final String humidity;
  final String lastSync;

  ContainerItem({
    required this.title,
    required this.status,
    required this.temperature,
    required this.humidity,
    required this.lastSync,
  });
}

// Container Card Widget
class ContainerCard extends StatelessWidget {
  final ContainerItem container;

  const ContainerCard({super.key, required this.container});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              container.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).statusContainer),
                Text(container.status),
              ],
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
                Text(container.temperature),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.water_drop_outlined, size: 20),
                    SizedBox(width: 8),
                    Text(S.of(context).humidity),
                  ],
                ),
                Text(container.humidity),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children:  [
                    Icon(Icons.hourglass_empty, size: 20),
                    SizedBox(width: 8),
                    Text(S.of(context).lastSync),
                  ],
                ),
                Text(container.lastSync),
              ],
            ),
          ],
        ),
      ),
    );
  }
}