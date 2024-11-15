import 'package:dittobox_mobile/account_and_subscription/presentation/account-details/account_details_screen.dart';
import 'package:dittobox_mobile/account_and_subscription/presentation/subscription-details/subscription_details_screen.dart';
import 'package:dittobox_mobile/account_and_subscription/presentation/subscription-plans/subscription_plans_screen.dart';
import 'package:dittobox_mobile/containers/presentation/add-template/add_template_screen.dart';
import 'package:dittobox_mobile/containers/presentation/container-list/container_list_view.dart';
import 'package:dittobox_mobile/containers/presentation/template-list/template_list_screen.dart';
import 'package:dittobox_mobile/goups/presentation/facilities-list/facilities_list_view.dart';
import 'package:dittobox_mobile/goups/presentation/worker-details/worker_details_screen.dart';
import 'package:dittobox_mobile/goups/presentation/worker-list/worker_list_view.dart';
import 'package:dittobox_mobile/shared/presentation/notifications-screen/notification_list_view.dart';
import 'package:dittobox_mobile/user_and_profile/infrastructure/models/profile_model.dart';
import 'package:dittobox_mobile/user_and_profile/presentation/change-password-view/forgot_password_screen.dart';
import 'package:dittobox_mobile/user_and_profile/presentation/change-password-view/password_reset_code_screen.dart';
import 'package:dittobox_mobile/user_and_profile/presentation/change-password-view/set_new_password_screen.dart';
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
  '/': (context) => const LoginScreen(),
  '/home': (context) => const TemplateListScreen(),
  '/workers': (context) => const WorkerListView(),
  '/workerDetails': (context) => WorkerDetailScreen(worker: Profile(
    id: -1,
    firstName: 'John',
    lastName: 'Doe',
    accountId: -1,
    groupId: -1,
    userId: -1,
    privileges: ['read', 'write']
  )),
  '/subscriptionDetails': (context) => const SubscriptionDetailsScreen(),
  '/accountDetails': (context) => const AccountDetailsScreen(),
  '/containers': (context) => const ContainerListScreen(),
  '/forgotPassword': (context) => const ForgotPasswordScreen(),
  '/password_reset_code': (context) => const PasswordResetCodeScreen(),
  '/set_new_password': (context) => const SetNewPasswordScreen(),
  '/subscription_plans': (context) => const SubscriptionPlansScreen(),
  '/notifications': (context) => NotificationScreen(),
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
  static const String accountDetails = '/accountDetails';
  static const String containers = '/containers';
  static const String forgotPassword = '/forgotPassword';
  static const String passwordResetCode = '/password_reset_code';
  static const String setNewPassword = '/set_new_password';
  static const String subscriptionPlans = '/subscription_plans';
  static const String notifications = '/notifications';
}