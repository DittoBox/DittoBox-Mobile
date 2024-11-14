import 'package:dittobox_mobile/containers/infrastructure/models/container.dart' as model;
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';

class ContainerBottomSheet extends StatelessWidget {
  final model.Container container;

  const ContainerBottomSheet({super.key, required this.container});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Slide Indicator
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            
            // Header with Title and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  container.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  container.lastKnownContainerStatus,
                  style: TextStyle(
                    color: container.lastKnownContainerStatus == 'Active' ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(container.description),
            const SizedBox(height: 16),
            
            // Information Rows
            buildInfoRowWithIcon(Icons.thermostat_outlined, S.of(context).temperature, container.temperature),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(Icons.water_drop_outlined, S.of(context).humidity, container.humidity),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(Icons.air_outlined, S.of(context).oxygen, container.oxygen),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(Icons.cloud_outlined, S.of(context).carbonDioxide, container.dioxide),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(Icons.eco_outlined, S.of(context).ethylene, container.ethylene),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(Icons.science_outlined, S.of(context).ammonia, container.ammonia),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(Icons.warning_amber_outlined, S.of(context).sulfurDioxide, container.sulfurDioxide),
            const SizedBox(height: 16),
            buildInfoRowWithIcon(Icons.health_and_safety_outlined, S.of(context).lastKnownHealthStatus, container.lastKnownHealthStatus),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(Icons.sync_outlined, S.of(context).lastSync, container.lastSync.toString()),
            const SizedBox(height: 16),

            
            // Manual Edit Button
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton(
                onPressed: () {},
                child: Text(S.of(context).editContainer),
              ),
            ),
            const SizedBox(height: 16),
            
            // Template Configuration Section
            const Divider(),
            const SizedBox(height: 8),
            Text(
              S.of(context).templateConfiguration,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            // Temperature Configuration
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).temperature),
                const Text("0°C - 4°C"),
              ],
            ),
            const SizedBox(height: 8),
            
            // Humidity Configuration
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).humidity),
                const Text("40% - 60%"),
              ],
            ),
            const SizedBox(height: 16),
            
            // Gases Detection Configuration
            Text( S.of(context).detectGases , style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).oxygen),
                const Text("19% - 23%"),
              ],
            ),
            const SizedBox(height: 8),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).carbonDioxide),
                const Text("0.03% - 0.1%"),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).ethylene),
                const Text("0% - 0.05%"),
              ],
            ),
            const SizedBox(height: 8),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).ammonia),
                const Text("0% - 0.02%"),
              ],
              ),
              const SizedBox(height: 8),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).sulfurDioxide),
                const Text("0% - 0.01%"),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: () {
                  // Acción para cambiar plantilla
                },
                child:  Text(S.of(context).changeTemplate),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRowWithIcon(IconData icon, String label, dynamic value) {
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
        Text(value?.toString() ?? '--'),
      ],
    );
  }
}