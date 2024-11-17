import 'package:dittobox_mobile/containers/infrastructure/data_sources/template_service.dart';
import 'package:dittobox_mobile/containers/infrastructure/data_sources/container_service.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/widgets/custom_navigator_drawer.dart';
import 'package:dittobox_mobile/containers/infrastructure/models/template.dart';
import 'package:dittobox_mobile/containers/infrastructure/models/container.dart' as model;
import 'package:dittobox_mobile/containers/presentation/widgets/container_selection_modal.dart';
import 'package:dittobox_mobile/containers/presentation/widgets/template_bottom_sheet.dart';

class TemplateListScreen extends StatefulWidget {
  const TemplateListScreen({super.key});

  @override
  State<TemplateListScreen> createState() => _TemplateListScreenState();
}

class _TemplateListScreenState extends State<TemplateListScreen> {
  List<model.Container> _containers = [];

  @override
  void initState() {
    super.initState();
    _loadContainers();
  }

  Future<void> _loadContainers() async {
    try {
      final containerService = ContainerService();
      final containers = await containerService.getContainersByAccountId();
      setState(() {
        _containers = containers;
      });
    } catch (e) {
      print('Error loading containers: $e');
    }
  }

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
  final List<model.Container> containers;

  const TemplateList({super.key, required this.containers});

  @override
  State<TemplateList> createState() => _TemplateListState();
}

class _TemplateListState extends State<TemplateList> {
  final TemplateService _templateService = TemplateService();
  List<Template> _templates = [];
  List<Template> _filteredTemplates = [];
  final TextEditingController _searchController = TextEditingController();
  final List<String> _categories = ['All', 'Produce', 'Meats', 'AnimalDerived', 'ProcessedFood'];
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _loadTemplates();
    _searchController.addListener(_filterTemplates);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterTemplates);
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadTemplates() async {
    try {
      final templates = await _templateService.getTemplates();
      setState(() {
        _templates = templates;
        _filteredTemplates = templates;
      });
    } catch (e) {
      // Manejar el error de carga de templates
      print('Error loading templates: $e');
    }
  }

  void _filterTemplates() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTemplates = _templates.where((template) {
        final matchesCategory = _selectedCategory == 'All' || getCategoryName(template.category) == _selectedCategory;
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
                onApply: () => _showContainerSelectionModal(context, _filteredTemplates[index]),
                onTap: () => _showTemplateDetails(context, _filteredTemplates[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showContainerSelectionModal(BuildContext parentContext, Template template) {
    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return ContainerSelectionModal(
          containers: widget.containers,
          onContainerSelected: (container) async {
            try {
              final containerService = ContainerService();
              await containerService.assignTemplateToContainer(container.id, template.id);
              if (mounted) {
                _showSuccessDialog(parentContext, 'Template assigned to ${container.name}');
              }
            } catch (e) {
              if (mounted) {
                _showErrorDialog(parentContext, 'Failed to assign template: $e');
              }
            }
          },
        );
      },
    );
  }

  void _showTemplateDetails(BuildContext context, Template template) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return TemplateBottomSheet(template: template);
      },
    );
  }

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).success),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).ok),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).errorApplicatingaTemplate),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).ok),
            ),
          ],
        );
      },
    );
  }
}

// Template Card Widget
class TemplateCard extends StatelessWidget {
  final Template template;
  final VoidCallback onApply;
  final VoidCallback onTap;

  const TemplateCard({super.key, required this.template, required this.onApply, required this.onTap});

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                      Text('Category: ${getCategoryName(template.category)}'),
                      Text('Temperature: ${template.tempMin} - ${template.tempMax}'),
                      Text('Humidity: ${template.humidityMin} - ${template.humidityMax}')
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
      ),
    );
  }
}