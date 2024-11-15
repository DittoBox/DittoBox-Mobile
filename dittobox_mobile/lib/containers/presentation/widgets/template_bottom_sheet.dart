import 'package:dittobox_mobile/containers/infrastructure/models/template.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';

class TemplateBottomSheet extends StatelessWidget {
  final Template template;

  const TemplateBottomSheet({super.key, required this.template});

  String getCategoryName(String? category) {
    switch (category) {
      case '0':
        return 'Produce';
      case '1':
        return 'Meats';
      case '2':
        return 'AnimalDerived';
      case '3':
        return 'ProcessedFood';
      default:
        return 'Unknown';
    }
  }

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
            
            // Header with Title and Category
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  template.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  getCategoryName(template.category),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(template.description),
            const SizedBox(height: 16),
            
            // Information Rows
            buildInfoRowWithIcon(Icons.thermostat_outlined, S.of(context).temperature, '${template.tempMin} - ${template.tempMax}'),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(Icons.water_drop_outlined, S.of(context).humidity, '${template.humidityMin} - ${template.humidityMax}'),
            const SizedBox(height: 8),
            if (template.oxygenMin != null && template.oxygenMax != null)
              buildInfoRowWithIcon(Icons.air_outlined, S.of(context).oxygen, '${template.oxygenMin} - ${template.oxygenMax}'),
            const SizedBox(height: 8),
            if (template.carbonDioxideMin != null && template.carbonDioxideMax != null)
              buildInfoRowWithIcon(Icons.cloud_outlined, S.of(context).carbonDioxide, '${template.carbonDioxideMin} - ${template.carbonDioxideMax}'),
            const SizedBox(height: 8),
            if (template.ethyleneMin != null && template.ethyleneMax != null)
              buildInfoRowWithIcon(Icons.eco_outlined, S.of(context).ethylene, '${template.ethyleneMin} - ${template.ethyleneMax}'),
            const SizedBox(height: 8),
            if (template.ammoniaMin != null && template.ammoniaMax != null)
              buildInfoRowWithIcon(Icons.science_outlined, S.of(context).ammonia, '${template.ammoniaMin} - ${template.ammoniaMax}'),
            const SizedBox(height: 8),
            if (template.sulfurDioxideMin != null && template.sulfurDioxideMax != null)
              buildInfoRowWithIcon(Icons.warning_amber_outlined, S.of(context).sulfurDioxide, '${template.sulfurDioxideMin} - ${template.sulfurDioxideMax}'),
            const SizedBox(height: 8),

          ],
        ),
      ),
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
}