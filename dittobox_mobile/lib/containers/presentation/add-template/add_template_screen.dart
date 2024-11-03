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
  String? _selectedCategory;
  bool _detectAllGases = true;
  bool _detectOxygen = true;
  bool _detectCO2 = true;
  bool _detectEthylene = true;
  bool _detectAmmonia = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
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
                        labelText: '${S.of(context).tempMin} (%)',
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
                        labelText: '${S.of(context).tempMax} (%)',
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
                  const Icon(Icons.water_drop_outlined),
                  const SizedBox(width: 8),
                  Text(S.of(context).humidity, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                  const Icon(Icons.cloud_outlined),
                  const SizedBox(width: 8),
                  Text(S.of(context).gasDetection, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              SwitchListTile(
                title: Text(S.of(context).detectAllGases),
                value: _detectAllGases,
                onChanged: (bool value) {
                  setState(() {
                    _detectAllGases = value;
                    _detectOxygen = value;
                    _detectCO2 = value;
                    _detectEthylene = value;
                    _detectAmmonia = value;
                  });
                },              ),
              SwitchListTile(
                title: Text(S.of(context).oxygen),
                value: _detectOxygen && _detectAllGases,
                onChanged: _detectAllGases ? (bool value) {
                  setState(() {
                    _detectOxygen = value;
                  });
                } : null,
              ),
              if (_detectOxygen && _detectAllGases) ...[
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _oxygenMinController,
                        decoration: InputDecoration(
                          labelText: '${S.of(context).oxygenMin} (%)',
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
                        controller: _oxygenMaxController,
                        decoration: InputDecoration(
                          labelText: '${S.of(context).oxygenMax} (%)',
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
              ],
              SwitchListTile(
                title: Text(S.of(context).carbonDioxide),
                value: _detectCO2 && _detectAllGases,
                onChanged: _detectAllGases ? (bool value) {
                  setState(() {
                    _detectCO2 = value;
                  });
                } : null,
              ),
              if (_detectCO2 && _detectAllGases) ...[
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _co2MinController,
                        decoration: InputDecoration(
                          labelText: '${S.of(context).carbonDioxideMin} (%)',
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
                          labelText: '${S.of(context).carbonDioxideMax} (%)',
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
              ],
              SwitchListTile(
                title: Text(S.of(context).ethylene),
                value: _detectEthylene && _detectAllGases,
                onChanged: _detectAllGases ? (bool value) {
                  setState(() {
                    _detectEthylene = value;
                  });
                } : null,
              ),
              if (_detectEthylene && _detectAllGases) ...[
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _ethyleneMinController,
                        decoration: InputDecoration(
                          labelText: '${S.of(context).ethyleneMin} (%)',
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
                          labelText: '${S.of(context).ethyleneMax} (%)',
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
              ],
              SwitchListTile(
                title: Text(S.of(context).ammoniaAndSulfurDioxide),
                value: _detectAmmonia && _detectAllGases,
                onChanged: _detectAllGases ? (bool value) {
                  setState(() {
                    _detectAmmonia = value;
                  });
                } : null,
              ),
              if (_detectAmmonia && _detectAllGases) ...[
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _ammoniaMinController,
                        decoration: InputDecoration(
                          labelText: '${S.of(context).ammoniaMin} (%)',
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
                          labelText: '${S.of(context).ammoniaMax} (%)',
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
              ],
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