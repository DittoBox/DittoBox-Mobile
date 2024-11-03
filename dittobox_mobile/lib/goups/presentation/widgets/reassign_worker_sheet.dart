import 'package:dittobox_mobile/goups/presentation/widgets/confirm_assign_worker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/generated/l10n.dart';

class ReassignWorkerSheet extends StatefulWidget {
  final List<String> facilities; // Lista de nombres de facilities
  final String currentFacility;
  final Function(String) onSave; // Callback para enviar el nuevo facility seleccionado

  const ReassignWorkerSheet({
    super.key,
    required this.facilities,
    required this.currentFacility,
    required this.onSave,
  });

  @override
  _ReassignWorkerSheetState createState() => _ReassignWorkerSheetState();
}

class _ReassignWorkerSheetState extends State<ReassignWorkerSheet> {
  String? selectedFacility;

  @override
  void initState() {
    super.initState();
    selectedFacility = widget.currentFacility; // Preseleccionar el facility actual
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).reassignWorker,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: selectedFacility,
            items: widget.facilities.map((facility) {
              return DropdownMenuItem<String>(
                value: facility,
                child: Text(facility),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedFacility = value;
              });
            },
            decoration: InputDecoration(
              labelText: S.of(context).selectFacility,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
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
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context, 
                      builder: (BuildContext context) {
                        return ConfirmAssignWorkerDialog(
                          facilityName: selectedFacility ?? '',
                          onConfirm: () {
                            // Lógica para reasignar trabajador
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(S.of(context).workerReassigned),
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
    );
  }
}
