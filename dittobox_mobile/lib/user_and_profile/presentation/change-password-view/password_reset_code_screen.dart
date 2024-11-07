import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PasswordResetCodeScreen extends StatefulWidget {
  const PasswordResetCodeScreen({super.key});

  @override
  _PasswordResetCodeScreenState createState() => _PasswordResetCodeScreenState();
}

class _PasswordResetCodeScreenState extends State<PasswordResetCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.of(context).passwordResetCodeTitle,
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  appContext: context,
                  length: 5,
                  controller: _codeController,
                  onChanged: (value) {
                    // Handle code change
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).codeRequired;
                    }
                    if (value.length != 5) {
                      return  S.of(context).codeLength;
                    }
                    return null;
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    activeColor: Colors.lightGreen,
                    selectedColor: Colors.blue,
                    inactiveColor: Colors.grey,
                    fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 10), // Ajustar el espacio entre los campos de PIN
                  ),
                  mainAxisAlignment: MainAxisAlignment.center, // Centrar los campos de PIN
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.pushNamed(context, AppRoutes.setNewPassword); // Go to set new password
                    }
                  },
                  child: Text(S.of(context).verifyCode),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login); // Go back to login
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