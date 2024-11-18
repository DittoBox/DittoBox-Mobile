import 'package:dittobox_mobile/containers/infrastructure/models/template.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: theme.bottomSheetTheme.backgroundColor ?? theme.cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
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
                  color: theme.dividerColor,
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
                  style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  getCategoryName(template.category),
                  style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(template.description, style: textTheme.bodyMedium),
            const SizedBox(height: 16),
            
            // Information Rows
            buildInfoRowWithIcon(context, Icons.thermostat_outlined, S.of(context).temperature, '${template.tempMin.toStringAsFixed(2)} - ${template.tempMax.toStringAsFixed(2)} °C'),
            const SizedBox(height: 8),
            buildInfoRowWithIcon(context, Icons.water_drop_outlined, S.of(context).humidity, '${template.humidityMin.toStringAsFixed(2)} - ${template.humidityMax.toStringAsFixed(2)} %'),
            const SizedBox(height: 8),
            if (template.oxygenMin != null && template.oxygenMax != null)
              buildInfoRowWithIcon(context, Icons.air_outlined, S.of(context).oxygen, _formatGasValue(context, template.oxygenMin, template.oxygenMax, S.of(context).oxygen)),
            const SizedBox(height: 8),
            if (template.carbonDioxideMin != null && template.carbonDioxideMax != null)
              buildInfoRowWithIcon(context, Icons.cloud_outlined, S.of(context).carbonDioxide, _formatGasValue(context, template.carbonDioxideMin, template.carbonDioxideMax, S.of(context).carbonDioxide)),
            const SizedBox(height: 8),
            if (template.ethyleneMin != null && template.ethyleneMax != null)
              buildInfoRowWithIcon(context, Icons.eco_outlined, S.of(context).ethylene, '${template.ethyleneMin?.toInt()} - ${template.ethyleneMax?.toInt()} ppm'),
            const SizedBox(height: 8),
            if (template.ammoniaMin != null && template.ammoniaMax != null)
              buildInfoRowWithIcon(context, Icons.science_outlined, S.of(context).ammonia, '${template.ammoniaMin?.toInt()} - ${template.ammoniaMax?.toInt()} ppm'),
            const SizedBox(height: 8),
            if (template.sulfurDioxideMin != null && template.sulfurDioxideMax != null)
              buildInfoRowWithIcon(context, Icons.warning_amber_outlined, S.of(context).sulfurDioxide, '${template.sulfurDioxideMin?.toInt()} - ${template.sulfurDioxideMax?.toInt()} ppm'),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRowWithIcon(BuildContext context, IconData icon, String label, dynamic value) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: theme.iconTheme.color),
            const SizedBox(width: 8),
            Text(label, style: textTheme.bodyMedium),
          ],
        ),
        Text(value?.toString() ?? '--', style: textTheme.bodyMedium),
      ],
    );
  }

  String _formatGasValue(BuildContext context, double? min, double? max, String label) {
    if (min == null || max == null) return '--';
    if (label == S.of(context).oxygen || label == S.of(context).carbonDioxide) {
      return min >= 1000
          ? '${(min / 1000).toStringAsFixed(2)} - ${(max / 1000).toStringAsFixed(2)} %'
          : '${min.toStringAsFixed(2)} - ${max.toStringAsFixed(2)} ppm';
    } else {
      return '${min.toInt()} - ${max.toInt()} ppm';
    }
  }
}