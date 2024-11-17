import 'package:dittobox_mobile/containers/infrastructure/data_sources/template_service.dart';
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
  final _tempMinController = TextEditingController();
  final _tempMaxController = TextEditingController();
  final _humidityMinController = TextEditingController();
  final _humidityMaxController = TextEditingController();
  final _oxygenMinController = TextEditingController();
  final _oxygenMaxController = TextEditingController();
  final _co2MinController = TextEditingController();
  final _co2MaxController = TextEditingController();
  final _ethyleneMinController = TextEditingController();
  final _ethyleneMaxController = TextEditingController();
  final _ammoniaMinController = TextEditingController();
  final _ammoniaMaxController = TextEditingController();
  final _sulfurDioxideMinController = TextEditingController();
  final _sulfurDioxideMaxController = TextEditingController();
  int? _selectedCategory;
  bool _detectAllGases = true;
  bool _detectOxygen = true;
  bool _detectCO2 = true;
  bool _detectEthylene = true;
  bool _detectAmmonia = false;
  bool _detectSulfurDioxide = false;

  final TemplateService _templateService = TemplateService();

  @override
  void dispose() {
    _nameController.dispose();
    _tempMinController.dispose();
    _tempMaxController.dispose();
    _humidityMinController.dispose();
    _humidityMaxController.dispose();
    _oxygenMinController.dispose();
    _oxygenMaxController.dispose();
    _co2MinController.dispose();
    _co2MaxController.dispose();
    _ethyleneMinController.dispose();
    _ethyleneMaxController.dispose();
    _ammoniaMinController.dispose();
    _ammoniaMaxController.dispose();
    _sulfurDioxideMinController.dispose();
    _sulfurDioxideMaxController.dispose();
    super.dispose();
  }

  void _saveTemplate() async {
    if (_formKey.currentState!.validate()) {
      final templateData = {
        'name': _nameController.text,
        'category': _selectedCategory,
        'tempMin': _tempMinController.text,
        'tempMax': _tempMaxController.text,
        'humidityMin': _humidityMinController.text,
        'humidityMax': _humidityMaxController.text,
        'detectAllGases': _detectAllGases,
        'detectOxygen': _detectOxygen,
        'detectCO2': _detectCO2,
        'detectEthylene': _detectEthylene,
        'detectAmmonia': _detectAmmonia,
        'detectSulfurDioxide': _detectSulfurDioxide,
        'oxygenMin': _oxygenMinController.text,
        'oxygenMax': _oxygenMaxController.text,
        'co2Min': _co2MinController.text,
        'co2Max': _co2MaxController.text,
        'ethyleneMin': _ethyleneMinController.text,
        'ethyleneMax': _ethyleneMaxController.text,
        'ammoniaMin': _ammoniaMinController.text,
        'ammoniaMax': _ammoniaMaxController.text,
        'sulfurDioxideMin': _sulfurDioxideMinController.text,
        'sulfurDioxideMax': _sulfurDioxideMaxController.text,
      };

      try {
        await _templateService.createTemplate(templateData);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      } catch (e) {
        // Manejar el error
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create template: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).newTemplate),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
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
              DropdownButtonFormField<int>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  labelText: S.of(context).category,
                  border: const OutlineInputBorder(),
                ),
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text(S.of(context).produce),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Text(S.of(context).meats),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text(S.of(context).animalDerived),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text(S.of(context).processedFoods),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return S.of(context).pleaseSelectCategory;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.thermostat_outlined),
                  const SizedBox(width: 8),
                  Text(S.of(context).temperature, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _tempMinController,
                      decoration: InputDecoration(
                        labelText: '${S.of(context).tempMin} (°C)',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _tempMaxController,
                      decoration: InputDecoration(
                        labelText: '${S.of(context).tempMax} (°C)',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _humidityMinController,
                      decoration: InputDecoration(
                        labelText: '${S.of(context).humidityMin} (%)',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _humidityMaxController,
                      decoration: InputDecoration(
                        labelText: '${S.of(context).humidityMax} (%)',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _oxygenMinController,
                      decoration: InputDecoration(
                        labelText: '${S.of(context).oxygenMin} (ppm)',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (_detectOxygen && (value == null || value.isEmpty)) {
                          return S.of(context).requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _oxygenMaxController,
                      decoration: InputDecoration(
                        labelText: '${S.of(context).oxygenMax} (ppm)',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (_detectOxygen && (value == null || value.isEmpty)) {
                          return S.of(context).requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _co2MinController,
                      decoration: InputDecoration(
                        labelText: '${S.of(context).carbonDioxideMin} (ppm)',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (_detectCO2 && (value == null || value.isEmpty)) {
                          return S.of(context).requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _co2MaxController,
                      decoration: InputDecoration(
                        labelText: '${S.of(context).carbonDioxideMax} (ppm)',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (_detectCO2 && (value == null || value.isEmpty)) {
                          return S.of(context).requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _ethyleneMinController,
                      decoration: InputDecoration(
                        labelText: '${S.of(context).ethyleneMin} (ppm)',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (_detectEthylene && (value == null || value.isEmpty)) {
                          return S.of(context).requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _ethyleneMaxController,
                      decoration: InputDecoration(
                        labelText: '${S.of(context).ethyleneMax} (ppm)',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (_detectEthylene && (value == null || value.isEmpty)) {
                          return S.of(context).requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _ammoniaMinController,
                      decoration: InputDecoration(
                        labelText: '${S.of(context).ammoniaMin} (ppm)',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (_detectAmmonia && (value == null || value.isEmpty)) {
                          return S.of(context).requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _ammoniaMaxController,
                      decoration: InputDecoration(
                        labelText: '${S.of(context).ammoniaMax} (ppm)',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (_detectAmmonia && (value == null || value.isEmpty)) {
                          return S.of(context).requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _sulfurDioxideMinController,
                      decoration: InputDecoration(
                        labelText: '${S.of(context).sulfurDioxideMin} (ppm)',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (_detectSulfurDioxide && (value == null || value.isEmpty)) {
                          return S.of(context).requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _sulfurDioxideMaxController,
                      decoration: InputDecoration(
                        labelText: '${S.of(context).sulfurDioxideMax} (ppm)',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (_detectSulfurDioxide && (value == null || value.isEmpty)) {
                          return S.of(context).requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilledButton(
                    onPressed: _saveTemplate,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    ),
                    child: Text(S.of(context).save),
                  ),
                  const SizedBox(width: 20),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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