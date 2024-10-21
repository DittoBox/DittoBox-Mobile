import 'package:flutter/material.dart';
import 'package:dittobox_mobile/generated/l10n.dart';

class AddTemplateScreen extends StatefulWidget {
  const AddTemplateScreen({super.key});

  @override
  _AddTemplateScreenState createState() => _AddTemplateScreenState();
}

class _AddTemplateScreenState extends State<AddTemplateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedCategory;
  bool _detectOxygen = true;
  bool _detectCO2 = true;
  bool _detectEthylene = true;
  bool _detectAmmonia = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveTemplate() {
    if (_formKey.currentState!.validate()) {
      // Aquí puedes añadir la lógica para guardar el template
      // Por ejemplo, añadirlo a una lista o enviarlo a un servidor

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(S.of(context).templateLibrary),
            const Icon(Icons.chevron_right),
            const Text('New Template'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: S.of(context).templateName,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).pleaseEnterTemplateName;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: S.of(context).description,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).pleaseEnterDescription;
                  }
                  return null;
                },
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  labelText: S.of(context).category,
                  border: const OutlineInputBorder(),
                ),
                items: [
                  DropdownMenuItem(
                    value: 'Produce',
                    child: Text(S.of(context).produce),
                  ),
                  DropdownMenuItem(
                    value: 'Meats',
                    child: Text(S.of(context).meats),
                  ),
                  DropdownMenuItem(
                    value: 'Animal derived',
                    child: Text(S.of(context).animalDerived),
                  ),
                  DropdownMenuItem(
                    value: 'Processed foods',
                    child: Text(S.of(context).processedFoods),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).pleaseSelectCategory;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Text(S.of(context).gasDetection, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SwitchListTile(
                title: Text(S.of(context).oxygen),
                value: _detectOxygen,
                onChanged: (bool value) {
                  setState(() {
                    _detectOxygen = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text(S.of(context).carbonDioxide),
                value: _detectCO2,
                onChanged: (bool value) {
                  setState(() {
                    _detectCO2 = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text(S.of(context).ethylene),
                value: _detectEthylene,
                onChanged: (bool value) {
                  setState(() {
                    _detectEthylene = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text(S.of(context).ammoniaAndSulfurDioxide),
                value: _detectAmmonia,
                onChanged: (bool value) {
                  setState(() {
                    _detectAmmonia = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _saveTemplate,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text(S.of(context).save),
                  ),
                  const SizedBox(width: 20),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text(S.of(context).discard),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}