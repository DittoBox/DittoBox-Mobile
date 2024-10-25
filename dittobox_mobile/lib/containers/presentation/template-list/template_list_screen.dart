import 'package:flutter/material.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/widgets/custom_navigator_drawer.dart';
import 'package:dittobox_mobile/containers/infrastructure/models/template.dart';

class TemplateListScreen extends StatefulWidget {
  const TemplateListScreen({super.key});

  @override
  State<TemplateListScreen> createState() => _TemplateListScreenState();
}

class _TemplateListScreenState extends State<TemplateListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).templateLibrary),
      ),
      drawer: const CustomNavigationDrawer(currentRoute: AppRoutes.templates),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: TemplateList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTemplate,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTemplate() {
    Navigator.pushNamed(context, AppRoutes.addTemplate);
  }
}

// Template List Widget
class TemplateList extends StatefulWidget {
  const TemplateList({super.key});

  @override
  State<TemplateList> createState() => _TemplateListState();
}

class _TemplateListState extends State<TemplateList> {
  final List<Template> _templates = [
    Template(
      name: 'Apples',
      description: 'Fruits and vegetables',
      category: 'Produce',
      tempMin: 0.0,
      tempMax: 4.0,
      humidityMin: 85.0,
      humidityMax: 90.0,
      ethyleneMin: 0.5,
      ethyleneMax: 1.5,
    ),
    Template(
      name: 'Fresh tenderloin',
      description: 'Meats',
      category: 'Meats',
      tempMin: -2.0,
      tempMax: 2.0,
      humidityMin: 75.0,
      humidityMax: 80.0,
    ),
    Template(
      name: 'Parmesan cheese',
      description: 'Animal derived',
      category: 'Animal derived',
      tempMin: 8.0,
      tempMax: 15.0,
      humidityMin: 85.0,
      humidityMax: 95.0,
    ),
    Template(
      name: 'Brined pickles',
      description: 'Processed foods',
      category: 'Processed Food',
      tempMin: 1.0,
      tempMax: 4.0,
      humidityMin: 80.0,
      humidityMax: 85.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _templates.length,
      itemBuilder: (context, index) {
        return TemplateCard(
          template: _templates[index],
        );
      },
    );
  }
}

// Template Card Widget
class TemplateCard extends StatelessWidget {
  final Template template;

  const TemplateCard({super.key, required this.template});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: ClipRRect(
        child: Card.outlined(
          child: SizedBox(
            height: 150, // Ajusta la altura según tus necesidades
            child: Center(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(template.name, style: const TextStyle(fontSize: 25.0)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(template.description),
                    if (template.oxygenMin != null && template.oxygenMax != null)
                      Text('Oxygen: ${template.oxygenMin} - ${template.oxygenMax}'),
                    if (template.carbonDioxideMin != null && template.carbonDioxideMax != null)
                      Text('CO2: ${template.carbonDioxideMin} - ${template.carbonDioxideMax}'),
                    if (template.ethyleneMin != null && template.ethyleneMax != null)
                      Text('Ethylene: ${template.ethyleneMin} - ${template.ethyleneMax}'),
                    if (template.ammoniaMin != null && template.ammoniaMax != null)
                      Text('Ammonia: ${template.ammoniaMin} - ${template.ammoniaMax}'),
                    if (template.sulfurDioxideMin != null && template.sulfurDioxideMax != null)
                      Text('Sulfur Dioxide: ${template.sulfurDioxideMin} - ${template.sulfurDioxideMax}'),
                  ],
                ),
                trailing: OutlinedButton(
                  onPressed: () {},
                  child: Text(S.of(context).applyTemplate),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}