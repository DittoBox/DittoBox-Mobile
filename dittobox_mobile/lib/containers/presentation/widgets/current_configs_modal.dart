import 'package:dittobox_mobile/containers/infrastructure/models/container.dart' as model;
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';

class CurrentConfigsModal extends StatelessWidget {
  final model.Container container;

  const CurrentConfigsModal({super.key, required this.container});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).currentConfigs),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8, // Ajusta el ancho del modal
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildConfigRow(Icons.thermostat_outlined, 'Temperature', container.minTemp, container.maxTemp),
              const SizedBox(height: 10),
              _buildConfigRow(Icons.water_drop_outlined, 'Humidity', container.minHumidity, container.maxHumidity),
              const SizedBox(height: 10),
              _buildConfigRow(Icons.air_outlined, 'Oxygen', container.oxygenMin, container.oxygenMax),
              const SizedBox(height: 10),
              _buildConfigRow(Icons.cloud_outlined, 'Dioxide', container.dioxideMin, container.dioxideMax),
              const SizedBox(height: 10),
              _buildConfigRow(Icons.eco_outlined, 'Ethylene', container.ethyleneMin, container.ethyleneMax),
              const SizedBox(height: 10),
              _buildConfigRow(Icons.science_outlined, 'Ammonia', container.ammoniaMin, container.ammoniaMax),
              const SizedBox(height: 10),
              _buildConfigRow(Icons.warning_amber_outlined, 'Sulfur Dioxide', container.sulfurDioxideMin, container.sulfurDioxideMax),
            ],
          ),
        ),
      ),
      actions: [
        FilledButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(S.of(context).close),
        ),
      ],
    );
  }

  Widget _buildConfigRow(IconData icon, String label, double? minValue, double? maxValue) {
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
        Text('${minValue?.toString() ?? '--'} → ${maxValue?.toString() ?? '--'}'),
      ],
    );
  }
}