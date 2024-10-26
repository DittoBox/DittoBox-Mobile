import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/goups/infrastructure/data_sources/facilities_service.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/goups/infrastructure/models/facilities.dart';

class AddWorkerSheet extends StatefulWidget {
  const AddWorkerSheet({super.key});

  @override
  _AddWorkerSheetState createState() => _AddWorkerSheetState();
}

class _AddWorkerSheetState extends State<AddWorkerSheet> {
  final TextEditingController _emailController = TextEditingController();
  String? selectedRole;
  String? selectedFacility;
  List<Facility> facilities = [];
  final FacilitiesService _facilitiesService = FacilitiesService();

  @override
  void initState() {
    super.initState();
    _loadFacilities();
  }

  Future<void> _loadFacilities() async {
    try {
      final facilitiesList = await _facilitiesService.getFacilities();
      setState(() {
        facilities = facilitiesList;
      });
    } catch (e) {
      // Manejo de errores
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 30.0,
          right: 30.0,
          top: 30.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Sheet Indicator
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
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
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).addWorker,
                      style: const TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 26),
            // Email Field
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: S.of(context).email,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 26),
            // Role Dropdown
            DropdownButtonFormField<String>(
              value: selectedRole,
              items: ['Manager', 'Worker'].map((String role) {
                return DropdownMenuItem<String>(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedRole = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: S.of(context).role,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 26),
            // Facility Dropdown
            DropdownButtonFormField<String>(
              value: selectedFacility,
              items: facilities.map((Facility facility) {
                return DropdownMenuItem<String>(
                  value: facility.title,
                  child: Text(facility.title),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedFacility = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: S.of(context).selectFacility,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(S.of(context).cancel),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: () {
                    // Acción para guardar el trabajador
                  },
                  child: Text(S.of(context).save),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showAddWorkerSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const AddWorkerSheet(),
        ),
      );
    },
  );
}