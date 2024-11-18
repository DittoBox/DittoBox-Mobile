import 'package:flutter/material.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/widgets/custom_navigator_drawer.dart';
import 'package:dittobox_mobile/containers/infrastructure/models/template.dart';
import 'package:dittobox_mobile/containers/presentation/widgets/container_selection_modal.dart';


class TemplateListScreen extends StatefulWidget {
  const TemplateListScreen({super.key});

  @override
  State<TemplateListScreen> createState() => _TemplateListScreenState();
}

class _TemplateListScreenState extends State<TemplateListScreen> {
  final List<String> _containers = ['Container 1', 'Container 2', 'Container 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).templateLibrary),
      ),
      drawer: const CustomNavigationDrawer(currentRoute: AppRoutes.templates),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TemplateList(containers: _containers),
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
  final List<String> containers;

  const TemplateList({super.key, required this.containers});

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

  List<Template> _filteredTemplates = [];
  final TextEditingController _searchController = TextEditingController();
  final List<String> _categories = ['All', 'Produce', 'Meats', 'Animal derived', 'Processed Food'];
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _filteredTemplates = _templates;
    _searchController.addListener(_filterTemplates);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterTemplates() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTemplates = _templates.where((template) {
        final matchesCategory = _selectedCategory == 'All' || template.category == _selectedCategory;
        final matchesQuery = template.name.toLowerCase().contains(query) || template.description.toLowerCase().contains(query);
        return matchesCategory && matchesQuery;
      }).toList();
    });
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
      _filterTemplates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: S.of(context).search,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _categories.map((category) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ChoiceChip(
                  label: Text(category),
                  selected: _selectedCategory == category,
                  onSelected: (selected) {
                    if (selected) {
                      _selectCategory(category);
                    }
                  },
                ),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _filteredTemplates.length,
            itemBuilder: (context, index) {
              return TemplateCard(
                template: _filteredTemplates[index],
                onApply: () => _showContainerSelectionModal(_filteredTemplates[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showContainerSelectionModal(Template template) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ContainerSelectionModal(containers: widget.containers);
      },
    );
  }
}

// Template Card Widget
class TemplateCard extends StatelessWidget {
  final Template template;
  final VoidCallback onApply;

  const TemplateCard({super.key, required this.template, required this.onApply});

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
                  onPressed: onApply,
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
