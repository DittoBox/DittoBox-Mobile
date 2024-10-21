import 'package:dittobox_mobile/containers/presentation/add-template/add_template_screen.dart';
import 'package:dittobox_mobile/containers/presentation/template-list/template_list_screen.dart';
import 'package:dittobox_mobile/goups/presentation/facilities-list/facilities_list_view.dart';
import 'package:dittobox_mobile/user_and_profile/presentation/login-screen/login_screen.dart';
import 'package:dittobox_mobile/user_and_profile/presentation/register-screen/company_info_screen.dart';
import 'package:dittobox_mobile/user_and_profile/presentation/register-screen/register_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/company_info': (context) => const CompanyInfoScreen(),
  '/facilities': (context) => const FacilitiesListScreen(),
  '/templates': (context) => const TemplateListScreen(),
  '/addTemplate': (context) => const AddTemplateScreen(),
};

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String companyInfo = '/company_info';
  static const String facilities = '/facilities';
  static const String templates = '/templates';
  static const String addTemplate = '/addTemplate';
}