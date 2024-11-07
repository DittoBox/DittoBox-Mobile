import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PasswordResetCodeScreen extends StatelessWidget {
  const PasswordResetCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
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
                onChanged: (value) {
                  // Handle code change
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
                  // Handle code verification logic
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
    );
  }
}