import 'package:dittobox_mobile/containers/infrastructure/models/container.dart' as model;
import 'package:dittobox_mobile/containers/infrastructure/data_sources/template_service.dart';
import 'package:dittobox_mobile/containers/infrastructure/data_sources/container_service.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'edit_container_modal.dart';
import 'current_configs_modal.dart';
import 'template_selection_modal.dart';

class ContainerBottomSheet extends StatefulWidget {
  final model.Container container;
  final VoidCallback onTemplateAssigned;

  const ContainerBottomSheet({super.key, required this.container, required this.onTemplateAssigned});

  @override
  _ContainerBottomSheetState createState() => _ContainerBottomSheetState();
}

class _ContainerBottomSheetState extends State<ContainerBottomSheet> {
  bool _isLoading = false;
  bool _isSuccess = false;

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
                  widget.container.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.container.lastKnownContainerStatus,
                  style: TextStyle(
                    color: widget.container.lastKnownContainerStatus == 'Active' ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(widget.container.description),
            const SizedBox(height: 16),
            
            // Information Rows
            buildInfoRowWithIcon(Icons.thermostat_outlined, S.of(context).temperature, widget.container.temperature),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(Icons.water_drop_outlined, S.of(context).humidity, widget.container.humidity),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(Icons.air_outlined, S.of(context).oxygen, widget.container.oxygen),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(Icons.cloud_outlined, S.of(context).carbonDioxide, widget.container.dioxide),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(Icons.eco_outlined, S.of(context).ethylene, widget.container.ethylene),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(Icons.science_outlined, S.of(context).ammonia, widget.container.ammonia),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(Icons.warning_amber_outlined, S.of(context).sulfurDioxide, widget.container.sulfurDioxide),
            const SizedBox(height: 16),
            buildInfoRowWithIcon(Icons.health_and_safety_outlined, S.of(context).lastKnownHealthStatus, widget.container.lastKnownHealthStatus),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(Icons.sync_outlined, S.of(context).lastSync, widget.container.lastSync.toString()),
            const SizedBox(height: 16),

            // Buttons for Edit and View Current Configs
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    _showCurrentConfigsModal(context);
                  },
                  child: Text(S.of(context).viewCurrentConfigs),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: () {
                    _showEditModal(context);
                  },
                  child: Text(S.of(context).editContainer),
                ),
              ],
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

            // Check if all template parameters are null
            if (widget.container.minTemp == null && widget.container.maxTemp == null &&
                widget.container.minHumidity == null && widget.container.maxHumidity == null &&
                widget.container.oxygenMin == null && widget.container.oxygenMax == null &&
                widget.container.dioxideMin == null && widget.container.dioxideMax == null &&
                widget.container.ethyleneMin == null && widget.container.ethyleneMax == null &&
                widget.container.ammoniaMin == null && widget.container.ammoniaMax == null &&
                widget.container.sulfurDioxideMin == null && widget.container.sulfurDioxideMax == null)
              ...[
                Text(S.of(context).noTemplateAssigned),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () {
                      _showTemplateSelectionModal(context);
                    },
                    child: Text(S.of(context).assignTemplate),
                  ),
                ),
              ]
            else
              ...[
                _buildTemplateConfigRow(S.of(context).temperature, widget.container.minTemp, widget.container.maxTemp),
                const SizedBox(height: 8),
                _buildTemplateConfigRow(S.of(context).humidity, widget.container.minHumidity, widget.container.maxHumidity),
                const SizedBox(height: 8),
                _buildTemplateConfigRow(S.of(context).oxygen, widget.container.oxygenMin, widget.container.oxygenMax),
                const SizedBox(height: 8),
                _buildTemplateConfigRow(S.of(context).carbonDioxide, widget.container.dioxideMin, widget.container.dioxideMax),
                const SizedBox(height: 8),
                _buildTemplateConfigRow(S.of(context).ethylene, widget.container.ethyleneMin, widget.container.ethyleneMax),
                const SizedBox(height: 8),
                _buildTemplateConfigRow(S.of(context).ammonia, widget.container.ammoniaMin, widget.container.ammoniaMax),
                const SizedBox(height: 8),
                _buildTemplateConfigRow(S.of(context).sulfurDioxide, widget.container.sulfurDioxideMin, widget.container.sulfurDioxideMax),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () {
                      _showTemplateSelectionModal(context);
                    },
                    child: Text(S.of(context).changeTemplate),
                  ),
                ),
              ],
            const SizedBox(height: 16),

            // Progress Indicator
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(),
              )
            else if (_isSuccess)
              const Center(
                child: Icon(Icons.check_circle, color: Colors.green, size: 40),
              ),
          ],
        ),
      ),
    );
  }

  void _showEditModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return EditContainerModal(container: widget.container);
      },
    );
  }

  void _showCurrentConfigsModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CurrentConfigsModal(container: widget.container);
      },
    );
  }

void _showTemplateSelectionModal(BuildContext context) async {
  final templateService = TemplateService();
  final templates = await templateService.getTemplates();

  if (!mounted) return; // Verifica si el widget está montado antes de mostrar el diálogo

  showDialog(
    // ignore: use_build_context_synchronously
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(S.of(context).templateConfiguration),
            content: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    width: double.maxFinite,
                    child: TemplateSelectionModal(
                      templates: templates,
                      onTemplateSelected: (template) async {
                        setState(() {
                          _isLoading = true;
                        });
                        try {
                          final containerService = ContainerService();
                          await containerService.assignTemplateToContainer(widget.container.id, template.id);
                          if (!mounted) return; // Verifica si el widget está montado antes de actualizar el estado
                          setState(() {
                            _isLoading = false;
                            _isSuccess = true;
                          });
                          Future.delayed(const Duration(seconds: 2), () {
                            if (!mounted) return; // Verifica si el widget está montado antes de navegar
                            Navigator.of(context).pop(); // Cierra el modal
                            widget.onTemplateAssigned(); // Callback para recargar la lista de contenedores
                          });
                        } catch (e) {
                          if (!mounted) return; // Verifica si el widget está montado antes de actualizar el estado
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      },
                    ),
                  ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(S.of(context).cancel),
              ),
            ],
          );
        },
      );
    },
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

  Widget _buildTemplateConfigRow(String label, double? minValue, double? maxValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text('${minValue?.toString() ?? '--'} - ${maxValue?.toString() ?? '--'}'),
      ],
    );
  }
}