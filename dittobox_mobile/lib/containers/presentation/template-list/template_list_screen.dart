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
import 'package:path/path.dart';

class TemplateListScreen extends StatefulWidget {
  const TemplateListScreen({super.key});

  @override
  State<TemplateListScreen> createState() => _TemplateListScreenState();
}

class _TemplateListScreenState extends State<TemplateListScreen> {
  List<model.Container> _containers = [];
  bool _isLoading = true;

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
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading containers: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).templateLibrary),
      ),
      drawer: const CustomNavigationDrawer(currentRoute: AppRoutes.templates),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: TemplateList(containers: _containers),
            ),
    );
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
  bool _isLoading = true;

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
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading templates: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _filterTemplates() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTemplates = _templates.where((template) {
        final templateName = template.name.toLowerCase();
        return templateName.contains(query);
      }).toList();
    });
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
      if (category == 'All') {
        _filteredTemplates = _templates;
      } else {
        _filteredTemplates = _templates.where((template) {
          return template.category == category;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
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
            if (_isLoading)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: LinearProgressIndicator(),
              ),
          ],
        ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(_getCategoryTranslation(context, category)),
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
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : _filteredTemplates.isEmpty
                  ? Center(
                      child: Text(
                        S.of(context).noTemplatesFound,
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
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

  String _getCategoryTranslation(BuildContext context, String category) {
    switch (category) {
      case 'All':
        return S.of(context).all;
      case 'Produce':
        return S.of(context).Produce;
      case 'Meats':
        return S.of(context).meats;
      case 'AnimalDerived':
        return S.of(context).animalDerived;
      case 'ProcessedFood':
        return S.of(context).ProcessedFood;
      default:
        return category;
    }
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
                _showSuccessDialog(parentContext, S.of(context).templateAssignedSuccessfullyToContainer(container.name));
              }
            } catch (e) {
              if (mounted) {
                _showErrorDialog(parentContext, S.of(context).errorApplicatingaTemplate);
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

  String getCategoryName(BuildContext context, String? category) {
    switch (category) {
      case '0':
        return S.of(context).produce;
      case '1':
        return S.of(context).meats;
      case '2':
        return S.of(context).animalDerived;
      case '3':
        return S.of(context).processedFood;
      default:
        return '';
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
                      Text('${S.of(context).category}: ${getCategoryName(context, template.category)}'),
                      Text('${S.of(context).temperature}: ${template.tempMin} - ${template.tempMax}'),
                      Text('${S.of(context).humidity}: ${template.humidityMin} - ${template.humidityMax}')
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