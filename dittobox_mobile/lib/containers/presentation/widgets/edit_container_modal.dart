import 'package:dittobox_mobile/containers/infrastructure/data_sources/container_service.dart';
import 'package:dittobox_mobile/containers/infrastructure/models/container.dart' as model;
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditContainerModal extends StatefulWidget {
  final model.Container container;

  const EditContainerModal({super.key, required this.container});

  @override
  _EditContainerModalState createState() => _EditContainerModalState();
}

class _EditContainerModalState extends State<EditContainerModal> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> _parameters;

  @override
  void initState() {
    super.initState();
    _parameters = {
      "minTemp": widget.container.minTemp,
      "maxTemp": widget.container.maxTemp,
      "minHumidity": widget.container.minHumidity,
      "maxHumidity": widget.container.maxHumidity,
      "oxygenMin": widget.container.oxygenMin,
      "oxygenMax": widget.container.oxygenMax,
      "dioxideMin": widget.container.dioxideMin,
      "dioxideMax": widget.container.dioxideMax,
      "ethyleneMin": widget.container.ethyleneMin,
      "ethyleneMax": widget.container.ethyleneMax,
      "ammoniaMin": widget.container.ammoniaMin,
      "ammoniaMax": widget.container.ammoniaMax,
      "sulfurDioxideMin": widget.container.sulfurDioxideMin,
      "sulfurDioxideMax": widget.container.sulfurDioxideMax,
    };
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).editContainer),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8, // Ajusta el ancho del modal
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextFieldRow('Min Temperature', 'minTemp', 'Max Temperature', 'maxTemp'),
                const SizedBox(height: 10),
                _buildTextFieldRow('Min Humidity', 'minHumidity', 'Max Humidity', 'maxHumidity'),
                const SizedBox(height: 10),

                _buildTextFieldRow('Min Oxygen', 'oxygenMin', 'Max Oxygen', 'oxygenMax'),
                const SizedBox(height: 10),

                _buildTextFieldRow('Min Dioxide', 'dioxideMin', 'Max Dioxide', 'dioxideMax'),
                const SizedBox(height: 10),

                _buildTextFieldRow('Min Ethylene', 'ethyleneMin', 'Max Ethylene', 'ethyleneMax'),
                const SizedBox(height: 10),

                _buildTextFieldRow('Min Ammonia', 'ammoniaMin', 'Max Ammonia', 'ammoniaMax'),
                const SizedBox(height: 10),
                _buildTextFieldRow('Min Sulfur Dioxide', 'sulfurDioxideMin', 'Max Sulfur Dioxide', 'sulfurDioxideMax'),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(S.of(context).cancel),
        ),
        FilledButton(
          onPressed: _submit,
          child: Text(S.of(context).save),
        ),
      ],
    );
  }

  Widget _buildTextFieldRow(String label1, String key1, String label2, String key2) {
    return Row(
      children: [
        Expanded(child: _buildTextField(label1, key1)),
        const SizedBox(width: 16),
        Expanded(child: _buildTextField(label2, key2)),
      ],
    );
  }

  Widget _buildTextField(String label, String key) {
    return TextFormField(
      initialValue: _parameters[key]?.toString(),
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      onSaved: (value) {
        _parameters[key] = int.tryParse(value ?? '') ?? 0;
      },
    );
  }

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      try {
        final containerService = ContainerService();
        await containerService.updateContainerParameters(widget.container.id, _parameters);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      } catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update container parameters: $e')),
        );
      }
    }
  }
}