import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/goups/infrastructure/data_sources/facilities_service.dart';
import 'package:dittobox_mobile/goups/presentation/widgets/confirm_assign_worker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/goups/infrastructure/models/facilities.dart';

class AddWorkerSheet extends StatefulWidget {
  final Facility? facility;

  const AddWorkerSheet({super.key, this.facility});

  @override
  _AddWorkerSheetState createState() => _AddWorkerSheetState();
}

class _AddWorkerSheetState extends State<AddWorkerSheet> {
  final TextEditingController _emailController = TextEditingController();
  String? selectedRole;
  String? selectedFacility;
  List<Facility> facilities = [];
  // final FacilitiesService _facilitiesService = FacilitiesService();
  bool isLoading = true; // Indicador de carga

  @override
  void initState() {
    super.initState();
    selectedFacility = widget.facility?.title; // Selecciona automáticamente la instalación
    _loadFacilities();
  }

  Future<void> _loadFacilities() async {
    try {
      // final facilitiesList = await _facilitiesService.getFacilities();

      // provitional data
      final facilitiesList = [
        Facility(
          title: 'Restaurante A',
          location: 'Ubicación A',
          type: 'restaurant',
          containers: 10,
          alerts: 2,
          workers: 5,
        ),
        Facility(
          title: 'Almacén B',
          location: 'Ubicación B',
          type: 'warehouse',
          containers: 20,
          alerts: 1,
          workers: 8,
        ),
      ];
      setState(() {
        facilities = facilitiesList;
        isLoading = false; // Finaliza la carga
      });
    } catch (e) {
      setState(() {
        isLoading = false; // Finaliza la carga incluso si hay un error
      });
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
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: S.of(context).email,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).requiredField;
                }
                if (!value.contains('@')) {
                  return S.of(context).invalidEmail;
                }
                return null;
              },
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
            isLoading
                ? const CircularProgressIndicator() // Muestra un indicador de carga mientras se cargan las instalaciones
                : DropdownButtonFormField<String>(
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
                    showDialog(
                      context: context, 
                      builder: (BuildContext context) {
                        return ConfirmAssignWorkerDialog(
                          facilityName: selectedFacility ?? '',
                          onConfirm: () {
                            // Lógica para asignar trabajador
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(S.of(context).workerAssignedSuccessfully),
                              ),
                            );
                          },
                        );
                      }
                    );
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

void showAddWorkerSheet(BuildContext context, Facility? facility) {
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
          child: AddWorkerSheet(facility: facility),
        ),
      );
    },
  );
}