import 'package:dittobox_mobile/account_and_subscription/infrastructure/data_sources/account_service.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

class CompanyInfoScreen extends StatefulWidget {
  const CompanyInfoScreen({super.key});

  @override
  State<CompanyInfoScreen> createState() => _CompanyInfoScreenState();
}

class _CompanyInfoScreenState extends State<CompanyInfoScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _identificationNumberController =
      TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final accountService = AccountService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                      height:
                          -100), // Ajusta este valor para mover el contenido hacia arriba o abajo
                  Text(
                    S.of(context).aboutYourCompany,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _companyNameController,
                    decoration: InputDecoration(
                      labelText: S.of(context).companyName,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The company name cannot be empty.';
                      } else if (!RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(value)) {
                        return 'The company name can only contain letters, numbers and spaces.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _identificationNumberController,
                    decoration: InputDecoration(
                      labelText: S.of(context).identificationNumber,
                      border: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The ID number cannot be empty.';
                      } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                        return 'The identification number can only contain digits.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _countryController,
                    decoration: InputDecoration(
                      labelText: S.of(context).country,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The country cannot be empty.';
                      } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                        return 'The country can only contain letters and spaces.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      labelText: S.of(context).city,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The city cannot be empty.';
                      } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                        return 'The city can only contain letters and spaces.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilledButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            var response = await accountService.createAccount(_companyNameController.text, _identificationNumberController.text);

                            if (response == 200) {
                              Navigator.pushNamed(context, AppRoutes.facilities);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('An error occurred. Please try again.'),
                                ),
                              );
                            }
                          }
                        },
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                        ),
                        child: Text(S.of(context).register),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
