import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;
  String userType = 'Worker';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
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
                  padding: const EdgeInsets.symmetric(horizontal: 80),
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
                    if (!value.contains('@')) {
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
                        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
                    if (value.length < 8) {
                      return S.of(context).passwordMustBeAtLeast8Characters;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      onPressed: () {
                        if (userType == 'Owner') {
                          Navigator.pushNamed(context, AppRoutes.companyInfo);
                        } else {
                          // Navigator.pushNamed(context, AppRoutes.home);
                        }
                      },
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      ),
                      child: Text(userType == 'Owner' ? "Continue" : S.of(context).register),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  child: Text(S.of(context).alreadyHaveAccount),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}