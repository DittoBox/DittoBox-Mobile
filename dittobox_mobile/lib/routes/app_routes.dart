import 'package:dittobox_mobile/goups/ui/screens/facilities_list_view.dart';
import 'package:dittobox_mobile/user_and_profile/ui/screens/company_info_screen.dart';
import 'package:dittobox_mobile/user_and_profile/ui/screens/login_screen.dart';
import 'package:dittobox_mobile/user_and_profile/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  '/company_info': (context) => const CompanyInfoScreen(),
  '/facilities': (context) => const FacilitiesListScreen(),


};

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String companyInfo = '/company_info';
  static const String facilities = '/facilities';
  
}