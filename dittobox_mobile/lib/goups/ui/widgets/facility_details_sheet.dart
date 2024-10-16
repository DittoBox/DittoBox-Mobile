import 'package:flutter/material.dart';
import 'package:dittobox_mobile/goups/models/facilities.dart';

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
                    const Text(
                      'Facilities',
                      style: TextStyle(
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
                    Text(
                      facility.location.split(', ')[0],
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Icon(Icons.chevron_right_outlined),
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
                    const Text(
                      'restaurant',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Contenido del BottomSheet
            buildInfoRowWithIcon(Icons.widgets_outlined, 'Containers', facility.containers),
            TextButton(
              onPressed: () {},
              child: const Text('Add containers'),
            ),
            const SizedBox(height: 8),

            buildInfoRowWithIcon(Icons.person_2_outlined, 'Workers', facility.workers),
            TextButton(
              onPressed: () {},
              child: const Text('Add workers'),
            ),
            const SizedBox(height: 8),

            buildInfoRowWithIcon(Icons.notifications_none_outlined, 'Pending Alerts', facility.alerts),
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