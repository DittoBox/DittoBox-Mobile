// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `DittoBox`
  String get title {
    return Intl.message(
      'DittoBox',
      name: 'title',
      desc: 'The title of the application',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: 'Welcome message for the user',
      args: [],
    );
  }

  /// `Facilities`
  String get facilities {
    return Intl.message(
      'Facilities',
      name: 'facilities',
      desc: 'Label for facilities section',
      args: [],
    );
  }

  /// `New facility`
  String get newFacility {
    return Intl.message(
      'New facility',
      name: 'newFacility',
      desc: 'Label for adding a new facility',
      args: [],
    );
  }

  /// `Containers`
  String get containers {
    return Intl.message(
      'Containers',
      name: 'containers',
      desc: 'Label for containers section',
      args: [],
    );
  }

  /// `Workers`
  String get workers {
    return Intl.message(
      'Workers',
      name: 'workers',
      desc: 'Label for workers section',
      args: [],
    );
  }

  /// `Pending Alerts`
  String get pendingAlerts {
    return Intl.message(
      'Pending Alerts',
      name: 'pendingAlerts',
      desc: 'Label for pending alerts section',
      args: [],
    );
  }

  /// `Add containers`
  String get addContainers {
    return Intl.message(
      'Add containers',
      name: 'addContainers',
      desc: 'Button label for adding containers',
      args: [],
    );
  }

  /// `Add workers`
  String get addWorkers {
    return Intl.message(
      'Add workers',
      name: 'addWorkers',
      desc: 'Button label for adding workers',
      args: [],
    );
  }

  /// `Check alerts`
  String get checkAlerts {
    return Intl.message(
      'Check alerts',
      name: 'checkAlerts',
      desc: 'Button label for checking alerts',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: 'Label for menu',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'Label for settings',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: 'Label for account section',
      args: [],
    );
  }

  /// `Subscription`
  String get subscription {
    return Intl.message(
      'Subscription',
      name: 'subscription',
      desc: 'Label for subscription section',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: 'Label for notifications section',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: 'Button label for logging out',
      args: [],
    );
  }

  /// `Facility name`
  String get facilityName {
    return Intl.message(
      'Facility name',
      name: 'facilityName',
      desc: 'Label for facility name input field',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: 'Label for city input field',
      args: [],
    );
  }

  /// `Region`
  String get region {
    return Intl.message(
      'Region',
      name: 'region',
      desc: 'Label for region input field',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Button label for canceling an action',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: 'Button label for saving an action',
      args: [],
    );
  }

  /// `About your company`
  String get aboutYourCompany {
    return Intl.message(
      'About your company',
      name: 'aboutYourCompany',
      desc: 'Label for company information section',
      args: [],
    );
  }

  /// `Company name`
  String get companyName {
    return Intl.message(
      'Company name',
      name: 'companyName',
      desc: 'Label for company name input field',
      args: [],
    );
  }

  /// `Identification number`
  String get identificationNumber {
    return Intl.message(
      'Identification number',
      name: 'identificationNumber',
      desc: 'Label for company identification number input field',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: 'Label for country input field',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: 'Button label for registering',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: 'Button label for logging in',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: 'Label for username input field',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: 'Label for password input field',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotPassword',
      desc: 'Link text for forgotten password',
      args: [],
    );
  }

  /// `Register instead`
  String get registerInstead {
    return Intl.message(
      'Register instead',
      name: 'registerInstead',
      desc: 'Link text for switching to registration',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: 'Button label for searching',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: 'Label for more options',
      args: [],
    );
  }

  /// `Failed to fetch facilities`
  String get failedToFetchFacilities {
    return Intl.message(
      'Failed to fetch facilities',
      name: 'failedToFetchFacilities',
      desc: 'Error message when failing to fetch facilities',
      args: [],
    );
  }

  /// `Alerts`
  String get alerts {
    return Intl.message(
      'Alerts',
      name: 'alerts',
      desc: 'Label for alerts',
      args: [],
    );
  }

  /// `Warehouse`
  String get warehouse {
    return Intl.message(
      'Warehouse',
      name: 'warehouse',
      desc: 'Label for werehouse section',
      args: [],
    );
  }

  /// `Restaurant`
  String get restaurant {
    return Intl.message(
      'Restaurant',
      name: 'restaurant',
      desc: 'Label for restaurant section',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: 'Label for name input field',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: 'Label for email input field',
      args: [],
    );
  }

  /// `Worker`
  String get worker {
    return Intl.message(
      'Worker',
      name: 'worker',
      desc: 'Label for worker user type',
      args: [],
    );
  }

  /// `Owner`
  String get owner {
    return Intl.message(
      'Owner',
      name: 'owner',
      desc: 'Label for owner user type',
      args: [],
    );
  }

  /// `Already have an account? Login instead`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? Login instead',
      name: 'alreadyHaveAccount',
      desc: 'Text for already have an account link',
      args: [],
    );
  }

  /// `Change to Spanish`
  String get changeToSpanish {
    return Intl.message(
      'Change to Spanish',
      name: 'changeToSpanish',
      desc: 'Button label for changing the language to Spanish',
      args: [],
    );
  }

  /// `Templates`
  String get templates {
    return Intl.message(
      'Templates',
      name: 'templates',
      desc: 'Label for templates section',
      args: [],
    );
  }

  /// `Template`
  String get template {
    return Intl.message(
      'Template',
      name: 'template',
      desc: 'Label for template section',
      args: [],
    );
  }

  /// `Change to English`
  String get changeToEnglish {
    return Intl.message(
      'Change to English',
      name: 'changeToEnglish',
      desc: 'Button label for changing the language to English',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
