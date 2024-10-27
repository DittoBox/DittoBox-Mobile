import 'package:dittobox_mobile/account_and_subscription/presentation/subscription-details/subscription_details_screen.dart';
import 'package:dittobox_mobile/containers/presentation/add-template/add_template_screen.dart';
import 'package:dittobox_mobile/containers/presentation/template-list/template_list_screen.dart';
import 'package:dittobox_mobile/goups/presentation/facilities-list/facilities_list_view.dart';
import 'package:dittobox_mobile/goups/presentation/worker-details/worker_details_screen.dart';
import 'package:dittobox_mobile/goups/presentation/worker-list/worker_list_view.dart';
import 'package:dittobox_mobile/user_and_profile/presentation/login-screen/login_screen.dart';
import 'package:dittobox_mobile/user_and_profile/presentation/register-screen/company_info_screen.dart';
import 'package:dittobox_mobile/user_and_profile/presentation/register-screen/register_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/company_info': (context) => const CompanyInfoScreen(), // Proporciona un usuario predeterminado
  '/facilities': (context) => const FacilitiesListScreen(),
  '/templates': (context) => const TemplateListScreen(),
  '/addTemplate': (context) => const AddTemplateScreen(),
  '/': (context) => const LoginScreen(),
  "/home": (context) => const TemplateListScreen(),
  "/workers": (context) => const WorkerListView(),
  "/workerDetails": (context) => WorkerDetailScreen(worker: User(name: '', role: '', location: '')), // Provide a valid User object
  "/subscriptionDetails": (context) => const SubscriptionDetailsScreen(),
};

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String companyInfo = '/company_info';
  static const String facilities = '/facilities';
  static const String templates = '/templates';
  static const String home = '/';
  static const String addTemplate = '/addTemplate';
  static const String workerlist = '/workers';
  static const String workerDetails = '/workerDetails';
  static const String subscriptionDetails = '/subscriptionDetails';
  
}