import 'package:dittobox_mobile/containers/presentation/widgets/add_container_sheet.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/goups/infrastructure/models/facilities.dart';
import 'package:dittobox_mobile/goups/presentation/widgets/add_worker_sheet.dart';

void showFacilityDetailsBottomSheet(BuildContext context, Facility facility) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(27.0),
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

            // Ruta de navegación
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      S.of(context).facilities,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Icon(Icons.chevron_right_outlined),
                    if (facility.location.split(', ').length > 1) ...[
                      Text(
                        facility.location.split(', ')[0],
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Icon(Icons.chevron_right_outlined),
                      Text(
                        facility.location.split(', ')[1],
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Icon(Icons.chevron_right_outlined),
                    ] else ...[
                      Text(
                        facility.location,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      facility.title,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      facility.type,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Contenido del BottomSheet
            buildInfoRowWithIcon(Icons.widgets_outlined, S.of(context).containers, facility.containers),
            TextButton(
              onPressed: () {
                showAddContainerSheet(context, facility); // Pasa la instalación seleccionada
              },
              child: Text(S.of(context).addContainers),
            ),
            const SizedBox(height: 8),

            buildInfoRowWithIcon(Icons.person_2_outlined, S.of(context).workers, facility.workers),
            TextButton(
              onPressed: () {
                showAddWorkerSheet(context, facility); // Pasa la instalación seleccionada
              },
              child: Text(S.of(context).addWorkers),
            ),
            const SizedBox(height: 8),

            buildInfoRowWithIcon(Icons.notifications_none_outlined, S.of(context).pendingAlerts, facility.alerts),
            TextButton(
              onPressed: () {},
              child: Text(S.of(context).checkAlerts),
            ),
          ],
        ),
      );
    },
  );
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