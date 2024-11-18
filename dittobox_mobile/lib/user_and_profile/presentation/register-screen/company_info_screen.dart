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
  final TextEditingController _identificationNumberController = TextEditingController();
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
                  const SizedBox(height: 20), // Ajusta este valor según sea necesario
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
                  FilledButton(
                    onPressed: () async {
                      if (formKey.currentState?.validate() ?? false) {
                        try {
                          final businessName = _companyNameController.text;
                          final businessId = _identificationNumberController.text;
                          final statusCode = await accountService.createAccount(businessName, businessId);
                          
                          if (statusCode == 200 || statusCode == 201) {
                            // Registro exitoso, puedes navegar a otra pantalla o mostrar un mensaje de éxito
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(S.of(context).accountCreatedSuccessfully)),
                            );
                            Navigator.popAndPushNamed(context, AppRoutes.facilities);
                          } else {
                            // Error en el registro, muestra un mensaje de error
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(S.of(context).errorCreatingAccount)),
                            );
                          }
                        } catch (e) {
                          // Manejo de errores
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('An error occurred: $e')),
                          );
                        }
                      }
                    },
                    child: Text(S.of(context).register),
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