import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).setNewPasswordTitle,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
               TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: S.of(context).newPassword,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: S.of(context).confirmPassword,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  // Handle password reset completion logic
                },
                child: Text(S.of(context).setNewPassword),
              ),
              SizedBox(height: 16),
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
    );
  }
}
