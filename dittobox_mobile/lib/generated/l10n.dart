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

  /// `Template Library`
  String get templateLibrary {
    return Intl.message(
      'Template Library',
      name: 'templateLibrary',
      desc: 'Label for template library section',
      args: [],
    );
  }

  /// `Apply`
  String get applyTemplate {
    return Intl.message(
      'Apply',
      name: 'applyTemplate',
      desc: 'Button label for applying a template',
      args: [],
    );
  }

  /// `Add template`
  String get addTemplate {
    return Intl.message(
      'Add template',
      name: 'addTemplate',
      desc: 'Button label for adding a template',
      args: [],
    );
  }

  /// `Please enter a name`
  String get pleaseEnterName {
    return Intl.message(
      'Please enter a name',
      name: 'pleaseEnterName',
      desc: 'Error message when name is not entered',
      args: [],
    );
  }

  /// `Please enter a description`
  String get pleaseEnterDescription {
    return Intl.message(
      'Please enter a description',
      name: 'pleaseEnterDescription',
      desc: 'Error message when description is not entered',
      args: [],
    );
  }

  /// `Please enter a category`
  String get pleaseEnterCategory {
    return Intl.message(
      'Please enter a category',
      name: 'pleaseEnterCategory',
      desc: 'Error message when category is not entered',
      args: [],
    );
  }

  /// `Please enter a minimum temperature`
  String get pleaseEnterTempMin {
    return Intl.message(
      'Please enter a minimum temperature',
      name: 'pleaseEnterTempMin',
      desc: 'Error message when minimum temperature is not entered',
      args: [],
    );
  }

  /// `Please enter a maximum temperature`
  String get pleaseEnterTempMax {
    return Intl.message(
      'Please enter a maximum temperature',
      name: 'pleaseEnterTempMax',
      desc: 'Error message when maximum temperature is not entered',
      args: [],
    );
  }

  /// `Please enter a minimum humidity`
  String get pleaseEnterHumidityMin {
    return Intl.message(
      'Please enter a minimum humidity',
      name: 'pleaseEnterHumidityMin',
      desc: 'Error message when minimum humidity is not entered',
      args: [],
    );
  }

  /// `Please enter a maximum humidity`
  String get pleaseEnterHumidityMax {
    return Intl.message(
      'Please enter a maximum humidity',
      name: 'pleaseEnterHumidityMax',
      desc: 'Error message when maximum humidity is not entered',
      args: [],
    );
  }

  /// `Please enter a temperature`
  String get pleaseEnterTemp {
    return Intl.message(
      'Please enter a temperature',
      name: 'pleaseEnterTemp',
      desc: 'Error message when temperature is not entered',
      args: [],
    );
  }

  /// `Please enter a humidity`
  String get pleaseEnterHumidity {
    return Intl.message(
      'Please enter a humidity',
      name: 'pleaseEnterHumidity',
      desc: 'Error message when humidity is not entered',
      args: [],
    );
  }

  /// `Pleasse enter an ethylene`
  String get pleaseEnterEthylene {
    return Intl.message(
      'Pleasse enter an ethylene',
      name: 'pleaseEnterEthylene',
      desc: 'Error message when ethylene is not entered',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: 'Label for description section',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: 'Label for category section',
      args: [],
    );
  }

  /// `Minimum temperature`
  String get tempMin {
    return Intl.message(
      'Minimum temperature',
      name: 'tempMin',
      desc: 'Label for minimum temperature section',
      args: [],
    );
  }

  /// `Maximum temperature`
  String get tempMax {
    return Intl.message(
      'Maximum temperature',
      name: 'tempMax',
      desc: 'Label for maximum temperature section',
      args: [],
    );
  }

  /// `Minimum humidity`
  String get humidityMin {
    return Intl.message(
      'Minimum humidity',
      name: 'humidityMin',
      desc: 'Label for minimum humidity section',
      args: [],
    );
  }

  /// `Maximum humidity`
  String get humidityMax {
    return Intl.message(
      'Maximum humidity',
      name: 'humidityMax',
      desc: 'Label for maximum humidity section',
      args: [],
    );
  }

  /// `Ethylene`
  String get ethylene {
    return Intl.message(
      'Ethylene',
      name: 'ethylene',
      desc: 'Label for ethylene section',
      args: [],
    );
  }

  /// `Template name`
  String get templateName {
    return Intl.message(
      'Template name',
      name: 'templateName',
      desc: 'Label for template name section',
      args: [],
    );
  }

  /// `Produce`
  String get produce {
    return Intl.message(
      'Produce',
      name: 'produce',
      desc: 'Label for produce section',
      args: [],
    );
  }

  /// `Meat`
  String get meat {
    return Intl.message(
      'Meat',
      name: 'meat',
      desc: 'Label for meat section',
      args: [],
    );
  }

  /// `Animal derived`
  String get animalDerived {
    return Intl.message(
      'Animal derived',
      name: 'animalDerived',
      desc: 'Label for animal derived section',
      args: [],
    );
  }

  /// `Processed food`
  String get processedFood {
    return Intl.message(
      'Processed food',
      name: 'processedFood',
      desc: 'Label for processed food section',
      args: [],
    );
  }

  /// `Please select a category`
  String get pleaseSelectCategory {
    return Intl.message(
      'Please select a category',
      name: 'pleaseSelectCategory',
      desc: 'Error message when category is not selected',
      args: [],
    );
  }

  /// `Please enter a template name`
  String get pleaseEnterTemplateName {
    return Intl.message(
      'Please enter a template name',
      name: 'pleaseEnterTemplateName',
      desc: 'Error message when template name is not entered',
      args: [],
    );
  }

  /// `Gas detection`
  String get gasDetection {
    return Intl.message(
      'Gas detection',
      name: 'gasDetection',
      desc: 'Label for gas detection section',
      args: [],
    );
  }

  /// `Oxygen`
  String get oxygen {
    return Intl.message(
      'Oxygen',
      name: 'oxygen',
      desc: 'Label for oxygen section',
      args: [],
    );
  }

  /// `Carbon dioxide`
  String get carbonDioxide {
    return Intl.message(
      'Carbon dioxide',
      name: 'carbonDioxide',
      desc: 'Label for carbon dioxide section',
      args: [],
    );
  }

  /// `Ammonia and sulfur dioxide`
  String get ammoniaAndSulfurDioxide {
    return Intl.message(
      'Ammonia and sulfur dioxide',
      name: 'ammoniaAndSulfurDioxide',
      desc: 'Label for ammonia and sulfur dioxide section',
      args: [],
    );
  }

  /// `Discard`
  String get discard {
    return Intl.message(
      'Discard',
      name: 'discard',
      desc: 'Button label for discarding an action',
      args: [],
    );
  }

  /// `Processed food`
  String get proccessedFood {
    return Intl.message(
      'Processed food',
      name: 'proccessedFood',
      desc: 'Label for processed food section',
      args: [],
    );
  }

  /// `Meats`
  String get meats {
    return Intl.message(
      'Meats',
      name: 'meats',
      desc: 'Label for meats section',
      args: [],
    );
  }

  /// `Processed foods`
  String get processedFoods {
    return Intl.message(
      'Processed foods',
      name: 'processedFoods',
      desc: 'Label for processed foods section',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: 'Label for type section',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: 'Label for language section',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: 'Label for English language',
      args: [],
    );
  }

  /// `Spanish`
  String get spanish {
    return Intl.message(
      'Spanish',
      name: 'spanish',
      desc: 'Label for Spanish language',
      args: [],
    );
  }

  /// `Select language`
  String get selectLanguage {
    return Intl.message(
      'Select language',
      name: 'selectLanguage',
      desc: 'Label for selecting language',
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
