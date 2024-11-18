import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/user_and_profile/infrastructure/data_sources/user_service.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final userService = UserService(); 

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                S.of(context).login,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: S.of(context).email,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).usernameCannotBeEmpty;
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
                    return S.of(context).passwordCannotBeEmpty;
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
                          final statusCode = await userService.loginUser(_emailController.text, _passwordController.text);
                          if (statusCode == 200) {
                            final prefs = SharedPreferencesAsync();
                            final accountId = await prefs.getInt('accountId');
                            print('accountId login: $accountId');
                            if (accountId != null && accountId != 0 && accountId != -1) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamed(context, AppRoutes.facilities);
                            } else {
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamed(context, AppRoutes.accountDetails); // Ruta si no hay userId
                            }
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(S.of(context).loginFailed),
                              ),
                            );
                          }
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Login failed: $e'),
                            ),
                          );
                        }
                      }
                    },
                    child: Text(S.of(context).login),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // TextButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, AppRoutes.forgotPassword);
              //   },
              //   child: Text(S.of(context).forgotPassword),
              // ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.register);
                },
                child: Text(S.of(context).registerInstead),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateTo(String route) {
    Navigator.pushNamed(context, route);
  }
}