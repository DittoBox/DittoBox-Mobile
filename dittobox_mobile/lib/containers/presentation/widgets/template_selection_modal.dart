import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/containers/infrastructure/models/template.dart';

class TemplateSelectionModal extends StatelessWidget {
  final List<Template> templates;
  final Function(Template) onTemplateSelected;

  const TemplateSelectionModal({
    super.key,
    required this.templates,
    required this.onTemplateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: templates.length,
        itemBuilder: (context, index) {
          final template = templates[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Theme.of(context).primaryColor, width: 1),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // Ajusta el ancho de la tarjeta
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(template.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      OutlinedButton(
                        onPressed: () {
                          onTemplateSelected(template);
                        },
                        child: Text(S.of(context).applyTemplate),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}