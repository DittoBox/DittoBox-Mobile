import 'package:dittobox_mobile/account_and_subscription/infrastructure/data_sources/account_service.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/user_and_profile/infrastructure/data_sources/user_service.dart';
import 'package:flutter/material.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  _SetNewPasswordScreenState createState() => _SetNewPasswordScreenState();
}
class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _userService = UserService();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).setNewPasswordTitle,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: S.of(context).newPassword,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).newPasswordRequired;
                    }
                    if (value.length < 6) {
                      return S.of(context).passwordLength;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: S.of(context).confirmPassword,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).confirmPasswordRequired;
                    }
                    if (value != _newPasswordController.text) {
                      return S.of(context).passwordsDoNotMatch;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      final statusCode = await _userService.changePassword(_newPasswordController.text);
                      if (statusCode == 200) {
                        Navigator.pushNamed(context, '/login');
                      } else {
                        // Manejar error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(S.of(context).passwordChangeFailed)),
                        );
                      }
                    }
                  },
                  child: Text(S.of(context).setNewPassword),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to login
                  },
                  child: Text(S.of(context).backToLogin),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}