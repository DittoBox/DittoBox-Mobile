import 'package:dittobox_mobile/user_and_profile/ui/screens/login_screen.dart';
import 'package:dittobox_mobile/user_and_profile/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DittoBox',
      home: RegisterScreen(),
      debugShowCheckedModeBanner: false,
    );
    
  }
}