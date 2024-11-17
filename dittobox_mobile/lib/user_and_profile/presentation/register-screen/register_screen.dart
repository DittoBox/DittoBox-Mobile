import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/user_and_profile/infrastructure/data_sources/user_service.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;
  String userType = 'Worker';
  final userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const SizedBox(height: 40),
                  Text(
                    S.of(context).register,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20, width: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: SegmentedButton<String>(
                      segments: <ButtonSegment<String>>[
                        ButtonSegment<String>(
                          value: 'Worker',
                          label: Text(S.of(context).worker),
                          enabled: true,
                        ),
                        ButtonSegment<String>(
                          value: 'Owner',
                          label: Text(S.of(context).owner),
                        ),
                      ],
                      selected: <String>{userType},
                      onSelectionChanged: (Set<String> newSelection) {
                        setState(() {
                          userType = newSelection.first;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: S.of(context).name,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name cannot be empty.';
                      } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                        return 'The name can only contain letters and spaces.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: S.of(context).username,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).usernameCannotBeEmpty;
                      } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                        return 'The username can only contain letters and numbers.';
                      } else if (value.length < 4) {
                        return 'The username must be at least 4 characters.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: S.of(context).email,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).requiredField;
                      }
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value)) {
                        return S.of(context).invalidEmail;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: S.of(context).password,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).requiredField;
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
                        try {
                          print('Form validated successfully.');
                          final registerResponse = await userService.registerUser(
                            _nameController.text,
                            _nameController.text,
                            _usernameController.text,
                            _emailController.text,
                            _passwordController.text,
                          );
                          print('Register response status: $registerResponse');
                          if (registerResponse == 200 || registerResponse == 201) {
                            final loginResponse = await userService.loginUser(
                              _emailController.text,
                              _passwordController.text,
                            );
                            print('Login response status: $loginResponse');
                            if (loginResponse == 200 || loginResponse == 201) {
                              print('Login successful. Navigating to the next screen.');
                              if (userType == 'Owner') {
                                print('Navigating to Company Info Screen.');
                                Navigator.pushReplacementNamed(
                                  context, AppRoutes.companyInfo);
                              } else {
                                print('Navigating to Facilities Screen.');
                                Navigator.pushReplacementNamed(
                                  context, AppRoutes.facilities);
                              }
                            } else {
                              print('Login failed.');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(S.of(context).loginFailed)
                                ),
                              );
                            }
                          } else {
                            print('Registration failed.');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(S.of(context).registrationFailed),
                              ),
                            );
                          }
                        } catch (e) {
                          print('Exception during registration: $e');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(S.of(context).registrationFailed + ': $e'),
                            ),
                          );
                        }
                      } else {
                        print('Form validation failed.');
                      }
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                    child: Text(userType == 'Owner' ? "Continue" : S.of(context).register),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    )
  )
);
  }
}