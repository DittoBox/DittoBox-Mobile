import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/routes/app_routes.dart'; 

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  // Future<bool> _login() async {
  //   final String username = _usernameController.text;
  //   final String password = _passwordController.text;

  //   try {
  //     await AccountService().login(username, password);
  //     return true;
  //   } catch (e) {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Inicio de sesión fallido: $e'),
  //         ),
  //       );
  //     }
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
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
                  } else if (value.length < 6) {
                    return 'The password must be at least 6 characters.';
                  } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return 'The password must contain at least one capital letter.';
                  } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'The password must contain at least one number.';
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
                        Navigator.pushNamed(context, AppRoutes.facilities);
                      }
                    },
                    child: Text(S.of(context).login),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Navigator.pushNamed(context, AppRoutes.forgotPassword);
                },
                child: Text(S.of(context).forgotPassword),
              ),
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
