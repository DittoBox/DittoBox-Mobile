import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/goups/infrastructure/data_sources/facilities_service.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/goups/infrastructure/models/facilities.dart';

class AddWorkerSheet extends StatefulWidget {
  final Facility? facility;
  final Function(String, int)? onSave;

  const AddWorkerSheet({super.key, this.facility, this.onSave});

  @override
  _AddWorkerSheetState createState() => _AddWorkerSheetState();
}

class _AddWorkerSheetState extends State<AddWorkerSheet> {
  final TextEditingController _emailController = TextEditingController();
  int? selectedFacilityId;
  List<Facility> facilities = [];
  bool isLoading = true; // Indicador de carga

  @override
  void initState() {
    super.initState();
    _loadFacilities();
  }

  Future<void> _loadFacilities() async {
    try {
      final facilitiesList = await FacilitiesService().getFacilities();

      setState(() {
        facilities = facilitiesList;
        isLoading = false; // Finaliza la carga
        if (widget.facility != null && facilities.any((facility) => facility.id == widget.facility!.id)) {
          selectedFacilityId = widget.facility!.id;
        } else if (facilities.isNotEmpty) {
          selectedFacilityId = facilities.first.id;
        }
        print('Selected Facility ID: $selectedFacilityId'); // Agrega esta línea para depurar
        print('Facilities: ${facilities.map((f) => f.title).toList()}'); // Agrega esta línea para depurar
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
            // Facility Dropdown
            isLoading
                ? const CircularProgressIndicator() // Muestra un indicador de carga mientras se cargan las instalaciones
                : DropdownButtonFormField<int>(
                    value: selectedFacilityId,
                    items: facilities.map((Facility facility) {
                      return DropdownMenuItem<int>(
                        value: facility.id,
                        child: Text(facility.title),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        selectedFacilityId = newValue;
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
                    final email = _emailController.text;
                    final facility = facilities.firstWhere((facility) => facility.id == selectedFacilityId);
                    if (widget.onSave != null) {
                      widget.onSave!(email, facility.id);
                    }
                    Navigator.pop(context);
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

void showAddWorkerSheet(BuildContext context, Function(String, int)? onSave) {
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
          child: AddWorkerSheet(onSave: onSave),
        ),
      );
    },
  );
}