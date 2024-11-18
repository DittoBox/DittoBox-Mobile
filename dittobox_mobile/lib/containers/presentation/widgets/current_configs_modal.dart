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
              _buildConfigRow(Icons.thermostat_outlined, 'Temperature', container.minTemp, container.maxTemp, '°C', 1),
              const SizedBox(height: 10),
              _buildConfigRow(Icons.water_drop_outlined, 'Humidity', container.minHumidity, container.maxHumidity, '%', 1),
              const SizedBox(height: 10),
              _buildConfigRow(Icons.air_outlined, 'Oxygen', container.oxygenMin, container.oxygenMax, 'ppm', 1, true),
              const SizedBox(height: 10),
              _buildConfigRow(Icons.cloud_outlined, 'Dioxide', container.dioxideMin, container.dioxideMax, 'ppm', 1, true),
              const SizedBox(height: 10),
              _buildConfigRow(Icons.eco_outlined, 'Ethylene', container.ethyleneMin, container.ethyleneMax, 'ppm', 0),
              const SizedBox(height: 10),
              _buildConfigRow(Icons.science_outlined, 'Ammonia', container.ammoniaMin, container.ammoniaMax, 'ppm', 0),
              const SizedBox(height: 10),
              _buildConfigRow(Icons.warning_amber_outlined, 'Sulfur Dioxide', container.sulfurDioxideMin, container.sulfurDioxideMax, 'ppm', 0),
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

  Widget _buildConfigRow(IconData icon, String label, double? minValue, double? maxValue, String unit, int decimals, [bool divideByThousand = false]) {
    String formatValue(double? value) {
      if (value == null) return '--';
      if (divideByThousand) {
        value /= 1000;
        return value.toStringAsFixed(decimals) + '%';
      }
      return value.toStringAsFixed(decimals) + ' ' + unit;
    }

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
        Text('${formatValue(minValue)} → ${formatValue(maxValue)}'),
      ],
    );
  }
}