import 'package:dittobox_mobile/containers/infrastructure/data_sources/container_service.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/goups/infrastructure/data_sources/facilities_service.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/goups/infrastructure/models/facilities.dart';
import 'package:flutter/services.dart'; // Importa el paquete

class AddContainerSheet extends StatefulWidget {
  final Facility facility; // Añadir el parámetro facility

  const AddContainerSheet({super.key, required this.facility}); // Modificar el constructor

  @override
  _AddContainerSheetState createState() => _AddContainerSheetState();
}

class _AddContainerSheetState extends State<AddContainerSheet> {
  final TextEditingController _containerNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  int? selectedFacilityId; // Valor por defecto
  List<Facility> facilities = []; // Lista de instalaciones
  final FacilitiesService _facilitiesService = FacilitiesService();
  final ContainerService _containerService = ContainerService();
  bool isLoading = true; // Indicador de carga

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
        selectedFacilityId = facilities.any((facility) => facility.id == widget.facility.id)
            ? widget.facility.id
            : facilities.isNotEmpty
                ? facilities.first.id
                : null;
        isLoading = false; // Finaliza la carga
      });
    } catch (e) {
      setState(() {
        isLoading = false; // Finaliza la carga incluso si hay un error
      });
      // Manejar errores
    }
  }

  Future<void> _createContainer() async {
    print('Iniciando creación de contenedor');
    try {
      final selectedFacilityObj = facilities.firstWhere((facility) => facility.id == selectedFacilityId);
      print('Facility seleccionada: ${selectedFacilityObj.id}');
      await _containerService.createContainer(
        _codeController.text, // Usar el código como deviceId
        _containerNameController.text,
        _descriptionController.text,
        selectedFacilityObj.id,
      );
      print('Contenedor creado exitosamente');
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          // ignore: use_build_context_synchronously
          content: Text(S.of(context).containerCreatedSuccessfully),
        ),
      );
    } catch (e) {
      print('Error creando contenedor: $e');
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
                      S.of(context).newContainer,
                      style: const TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 26),
            TextFormField(
              controller: _containerNameController,
              decoration: InputDecoration(
                labelText: S.of(context).containerName,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).requiredField;
                }
                return null;
              },
            ),
            const SizedBox(height: 26),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: S.of(context).description,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).requiredField;
                }
                return null;
              },
            ),
            const SizedBox(height: 26),
            TextFormField(
              controller: _codeController,
              decoration: InputDecoration(
                labelText: S.of(context).code,
                border: const OutlineInputBorder(),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')), // Permitir solo caracteres alfanuméricos
                LengthLimitingTextInputFormatter(10), // Limitar a 9 caracteres
              ],
            ),
            const SizedBox(height: 26),
            isLoading
                ? const CircularProgressIndicator() // Muestra un indicador de carga mientras se cargan las instalaciones
                : DropdownButtonFormField<int>(
                    value: selectedFacilityId,
                    items: facilities.map((Facility facility) {
                      return DropdownMenuItem<int>(
                        value: facility.id, // Asignar el valor del id
                        child: Text(facility.title), // Mostrar el título
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
                    print('Botón de guardar presionado');
                    _createContainer();
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

void showAddContainerSheet(BuildContext context, Facility facility) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddContainerSheet(facility: facility), // Pasar la instalación seleccionada
        ),
      );
    },
  );
}