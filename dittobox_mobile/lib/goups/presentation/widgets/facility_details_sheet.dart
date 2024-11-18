import 'package:dittobox_mobile/containers/presentation/widgets/add_container_sheet.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/goups/infrastructure/models/facilities.dart';
import 'package:dittobox_mobile/goups/presentation/widgets/add_worker_sheet.dart';
import 'package:dittobox_mobile/goups/infrastructure/data_sources/facilities_service.dart';

void showFacilityDetailsBottomSheet(BuildContext context, Facility facility, VoidCallback onDelete) {
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
                    if (facility.location.city!.split(', ').length > 1) ...[
                      Text(
                        facility.location.city!.split(', ')[0],
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Icon(Icons.chevron_right_outlined),
                      Text(
                        facility.location.city!.split(', ')[1],
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Icon(Icons.chevron_right_outlined),
                    ] else ...[
                      Text(
                        facility.location.city!,
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
                      facility.facilityType.toString(),
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
            buildInfoRowWithIcon(Icons.widgets_outlined, S.of(context).containers, facility.containerCount),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    showAddContainerSheet(context, facility); // Pasa la instalación seleccionada
                  },
                  child: Text(S.of(context).addContainers),
                ),
              ],
            ),
            const SizedBox(height: 8),

            buildInfoRowWithIcon(Icons.person_2_outlined, S.of(context).workers, facility.profileCount),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    showAddWorkerSheet(context, facility as Function(String p1, int p2)?); // Pasa la instalación seleccionada
                  },
                  child: Text(S.of(context).addWorkers),
                ),
                TextButton(
                  onPressed: () {
                    // Navegar a la vista de trabajadores del facility
                    Navigator.pushNamed(context, '/workers', arguments: facility);
                  },
                  child: Text(S.of(context).viewWorkers),
                ),
              ],
            ),
            const SizedBox(height: 8),

            FutureBuilder<int>(
              future: FacilitiesService().countNotificationsByGroupId(facility.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print('Esperando respuesta de countNotificationsByGroupId');
                  return buildInfoRowWithIcon(Icons.notifications_none_outlined, S.of(context).pendingAlerts, 0);
                } else if (snapshot.hasError) {
                  print('Error en countNotificationsByGroupId: ${snapshot.error}');
                  return buildInfoRowWithIcon(Icons.notifications_none_outlined, S.of(context).pendingAlerts, 0);
                } else {
                  print('Facility Details - Notificaciones recibidas: ${snapshot.data}');
                  return buildInfoRowWithIcon(Icons.notifications_none_outlined, S.of(context).pendingAlerts, snapshot.data ?? 0);
                }
              },
            ),
            TextButton(
              onPressed: () {
                // Navegar a la vista de alertas del facility
                Navigator.pushNamed(context, AppRoutes.notifications, arguments: facility);
              },
              child: Text(S.of(context).checkAlerts),
            ),
            const SizedBox(height: 16),
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