import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DittoBox',
      initialRoute: AppRoutes.facilities,
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
    );
    
  }
}
