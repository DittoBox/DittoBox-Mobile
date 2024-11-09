import 'package:dittobox_mobile/containers/presentation/container-list/container_list_view.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';

class ContainerBottomSheet extends StatelessWidget {
  final ContainerItem container;

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
                  container.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  container.status,
                  style: TextStyle(
                    color: container.status == 'Active' ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(S.of(context).containerDescription),
            const Text("Container with beef and tenderloin."),
            const SizedBox(height: 16),
            
            // Information Rows
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
                    const Icon(Icons.water_drop_outlined, size: 20),
                    const SizedBox(width: 8),
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
                  children: [
                    const Icon(Icons.hourglass_empty, size: 20),
                    const SizedBox(width: 8),
                    Text(S.of(context).lastSync),
                  ],
                ),
                Text(container.lastSync),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.air, size: 20),
                    const SizedBox(width: 8),
                    Text(S.of(context).oxygen),
                  ],
                ),
                Text(container.oxygen),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.air, size: 20),
                    const SizedBox(width: 8),
                    Text(S.of(context).carbonDioxide),
                  ],
                ),
                Text(container.carbonDioxide),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.air, size: 20),
                    const SizedBox(width: 8),
                    Text(S.of(context).ethylene),
                  ],
                ),
                Text(container.ethylene),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.air, size: 20),
                    const SizedBox(width: 8),
                    Text(S.of(context).ammoniaAndSulferDioxide),
                  ],
                ),
                Text(container.ammoniaAndSulferDioxide),
              ],
            ),
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
                Text(S.of(context).ammoniaAndSulferDioxide),
                const Text("0% - 0.02%"),
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
}