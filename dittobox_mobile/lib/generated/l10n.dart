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

  /// `Please enter a Min temperature`
  String get pleaseEnterTempMin {
    return Intl.message(
      'Please enter a Min temperature',
      name: 'pleaseEnterTempMin',
      desc: 'Error message when Min temperature is not entered',
      args: [],
    );
  }

  /// `Please enter a Max temperature`
  String get pleaseEnterTempMax {
    return Intl.message(
      'Please enter a Max temperature',
      name: 'pleaseEnterTempMax',
      desc: 'Error message when Max temperature is not entered',
      args: [],
    );
  }

  /// `Please enter a Min humidity`
  String get pleaseEnterHumidityMin {
    return Intl.message(
      'Please enter a Min humidity',
      name: 'pleaseEnterHumidityMin',
      desc: 'Error message when Min humidity is not entered',
      args: [],
    );
  }

  /// `Please enter a Max humidity`
  String get pleaseEnterHumidityMax {
    return Intl.message(
      'Please enter a Max humidity',
      name: 'pleaseEnterHumidityMax',
      desc: 'Error message when Max humidity is not entered',
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

  /// `Min temperature`
  String get tempMin {
    return Intl.message(
      'Min temperature',
      name: 'tempMin',
      desc: 'Label for Min temperature section',
      args: [],
    );
  }

  /// `Max temperature`
  String get tempMax {
    return Intl.message(
      'Max temperature',
      name: 'tempMax',
      desc: 'Label for Max temperature section',
      args: [],
    );
  }

  /// `Min humidity`
  String get humidityMin {
    return Intl.message(
      'Min humidity',
      name: 'humidityMin',
      desc: 'Label for Min humidity section',
      args: [],
    );
  }

  /// `Max humidity`
  String get humidityMax {
    return Intl.message(
      'Max humidity',
      name: 'humidityMax',
      desc: 'Label for Max humidity section',
      args: [],
    );
  }

  /// `Ethylene (C₂H₄)`
  String get ethylene {
    return Intl.message(
      'Ethylene (C₂H₄)',
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

  /// `Oxygen (O₂)`
  String get oxygen {
    return Intl.message(
      'Oxygen (O₂)',
      name: 'oxygen',
      desc: 'Label for oxygen section',
      args: [],
    );
  }

  /// `Carbon dioxide (CO₂)`
  String get carbonDioxide {
    return Intl.message(
      'Carbon dioxide (CO₂)',
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

  /// `Min carbon dioxide`
  String get carbonDioxideMin {
    return Intl.message(
      'Min carbon dioxide',
      name: 'carbonDioxideMin',
      desc: 'Label for Min carbon dioxide section',
      args: [],
    );
  }

  /// `Max carbon dioxide`
  String get carbonDioxideMax {
    return Intl.message(
      'Max carbon dioxide',
      name: 'carbonDioxideMax',
      desc: 'Label for Max carbon dioxide section',
      args: [],
    );
  }

  /// `Min ammonia and sulfur dioxide`
  String get ammoniaAndSulfurDioxideMin {
    return Intl.message(
      'Min ammonia and sulfur dioxide',
      name: 'ammoniaAndSulfurDioxideMin',
      desc: 'Label for Min ammonia and sulfur dioxide section',
      args: [],
    );
  }

  /// `Max ammonia and sulfur dioxide`
  String get ammoniaAndSulfurDioxideMax {
    return Intl.message(
      'Max ammonia and sulfur dioxide',
      name: 'ammoniaAndSulfurDioxideMax',
      desc: 'Label for Max ammonia and sulfur dioxide section',
      args: [],
    );
  }

  /// `Please enter a Min oxygen`
  String get pleaseEnterOxygenMin {
    return Intl.message(
      'Please enter a Min oxygen',
      name: 'pleaseEnterOxygenMin',
      desc: 'Error message when Min oxygen is not entered',
      args: [],
    );
  }

  /// `Min ethylene`
  String get ethyleneMin {
    return Intl.message(
      'Min ethylene',
      name: 'ethyleneMin',
      desc: 'Label for Min ethylene section',
      args: [],
    );
  }

  /// `Max ethylene`
  String get ethyleneMax {
    return Intl.message(
      'Max ethylene',
      name: 'ethyleneMax',
      desc: 'Label for Max ethylene section',
      args: [],
    );
  }

  /// `Min ammonia`
  String get ammoniaMin {
    return Intl.message(
      'Min ammonia',
      name: 'ammoniaMin',
      desc: 'Label for Min ammonia section',
      args: [],
    );
  }

  /// `Max ammonia`
  String get ammoniaMax {
    return Intl.message(
      'Max ammonia',
      name: 'ammoniaMax',
      desc: 'Label for Max ammonia section',
      args: [],
    );
  }

  /// `Min oxygen`
  String get oxygenMin {
    return Intl.message(
      'Min oxygen',
      name: 'oxygenMin',
      desc: 'Label for Min oxygen section',
      args: [],
    );
  }

  /// `Max oxygen`
  String get oxygenMax {
    return Intl.message(
      'Max oxygen',
      name: 'oxygenMax',
      desc: 'Label for Max oxygen section',
      args: [],
    );
  }

  /// `Detect all gases`
  String get detectAllGases {
    return Intl.message(
      'Detect all gases',
      name: 'detectAllGases',
      desc: 'Label for detecting all gases',
      args: [],
    );
  }

  /// `New template`
  String get newTemplate {
    return Intl.message(
      'New template',
      name: 'newTemplate',
      desc: 'Label for adding a new template',
      args: [],
    );
  }

  /// `Humidity`
  String get humidity {
    return Intl.message(
      'Humidity',
      name: 'humidity',
      desc: 'Label for humidity section',
      args: [],
    );
  }

  /// `Temperature`
  String get temperature {
    return Intl.message(
      'Temperature',
      name: 'temperature',
      desc: 'Label for temperature section',
      args: [],
    );
  }

  /// `Select containers`
  String get selectContainers {
    return Intl.message(
      'Select containers',
      name: 'selectContainers',
      desc: 'Label for selecting containers',
      args: [],
    );
  }

  /// `This change will be recorded in this container’s historial.`
  String get containerSelectionModal {
    return Intl.message(
      'This change will be recorded in this container’s historial.',
      name: 'containerSelectionModal',
      desc: 'Modal message for container selection',
      args: [],
    );
  }

  /// `New container`
  String get newContainer {
    return Intl.message(
      'New container',
      name: 'newContainer',
      desc: 'Label for adding a new container',
      args: [],
    );
  }

  /// `Container name`
  String get containerName {
    return Intl.message(
      'Container name',
      name: 'containerName',
      desc: 'Label for container name section',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: 'Label for code section',
      args: [],
    );
  }

  /// `Please enter a container name`
  String get pleaseEnterContainerName {
    return Intl.message(
      'Please enter a container name',
      name: 'pleaseEnterContainerName',
      desc: 'Error message when container name is not entered',
      args: [],
    );
  }

  /// `Select facility`
  String get selectFacility {
    return Intl.message(
      'Select facility',
      name: 'selectFacility',
      desc: 'Label for selecting facility',
      args: [],
    );
  }

  /// `Role`
  String get role {
    return Intl.message(
      'Role',
      name: 'role',
      desc: 'Label for role section',
      args: [],
    );
  }

  /// `Add worker`
  String get addWorker {
    return Intl.message(
      'Add worker',
      name: 'addWorker',
      desc: 'Button label for adding a worker',
      args: [],
    );
  }

  /// `Worker List`
  String get workerList {
    return Intl.message(
      'Worker List',
      name: 'workerList',
      desc: 'Label for Worker List',
      args: [],
    );
  }

  /// `Add container`
  String get addContainer {
    return Intl.message(
      'Add container',
      name: 'addContainer',
      desc: 'Button label for adding a container',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: 'Button label for deleting',
      args: [],
    );
  }

  /// `Are you sure you want to delete this?`
  String get areYouSureDelete {
    return Intl.message(
      'Are you sure you want to delete this?',
      name: 'areYouSureDelete',
      desc: 'Confirmation message for deleting',
      args: [],
    );
  }

  /// `Confirm delete`
  String get confirmDelete {
    return Intl.message(
      'Confirm delete',
      name: 'confirmDelete',
      desc: 'Button label for confirming deletion',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: 'Label for all section',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: 'Button label for editing',
      args: [],
    );
  }

  /// `Worker details`
  String get workerDetails {
    return Intl.message(
      'Worker details',
      name: 'workerDetails',
      desc: 'Label for worker details section',
      args: [],
    );
  }

  /// `Role management`
  String get roleManagement {
    return Intl.message(
      'Role management',
      name: 'roleManagement',
      desc: 'Label for role management section',
      args: [],
    );
  }

  /// `Reassign`
  String get reassign {
    return Intl.message(
      'Reassign',
      name: 'reassign',
      desc: 'Button label for reassigning',
      args: [],
    );
  }

  /// `Subscription details`
  String get subscriptionDetails {
    return Intl.message(
      'Subscription details',
      name: 'subscriptionDetails',
      desc: 'Label for subscription details section',
      args: [],
    );
  }

  /// `Upgrade plan`
  String get upgradePlan {
    return Intl.message(
      'Upgrade plan',
      name: 'upgradePlan',
      desc: 'Button label for upgrading plan',
      args: [],
    );
  }

  /// `Payment information`
  String get paymentInformation {
    return Intl.message(
      'Payment information',
      name: 'paymentInformation',
      desc: 'Label for payment information section',
      args: [],
    );
  }

  /// `Cancel subscription`
  String get cancelSubscription {
    return Intl.message(
      'Cancel subscription',
      name: 'cancelSubscription',
      desc: 'Button label for canceling subscription',
      args: [],
    );
  }

  /// `View workers`
  String get viewWorkers {
    return Intl.message(
      'View workers',
      name: 'viewWorkers',
      desc: 'Button label for viewing workers',
      args: [],
    );
  }

  /// `View containers`
  String get viewContainers {
    return Intl.message(
      'View containers',
      name: 'viewContainers',
      desc: 'Button label for viewing containers',
      args: [],
    );
  }

  /// `Last sync`
  String get lastSync {
    return Intl.message(
      'Last sync',
      name: 'lastSync',
      desc: 'Label for last sync section',
      args: [],
    );
  }

  /// `Status`
  String get statusContainer {
    return Intl.message(
      'Status',
      name: 'statusContainer',
      desc: 'Label for status section',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get passwordCannotBeEmpty {
    return Intl.message(
      'Password cannot be empty',
      name: 'passwordCannotBeEmpty',
      desc: 'Error message when password is empty',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordMustBeAtLeast8Characters {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordMustBeAtLeast8Characters',
      desc: 'Error message when password is less than 8 characters',
      args: [],
    );
  }

  /// `Username cannot be empty`
  String get usernameCannotBeEmpty {
    return Intl.message(
      'Username cannot be empty',
      name: 'usernameCannotBeEmpty',
      desc: 'Error message when username is empty',
      args: [],
    );
  }

  /// `This is a required field`
  String get requiredField {
    return Intl.message(
      'This is a required field',
      name: 'requiredField',
      desc: 'Error message when field is required',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalidEmail {
    return Intl.message(
      'Invalid email',
      name: 'invalidEmail',
      desc: 'Error message when email is invalid',
      args: [],
    );
  }

  /// `User Information`
  String get userInformation {
    return Intl.message(
      'User Information',
      name: 'userInformation',
      desc: 'Label for user information section',
      args: [],
    );
  }

  /// `User Information Details`
  String get userInformationDetails {
    return Intl.message(
      'User Information Details',
      name: 'userInformationDetails',
      desc: 'Label for user information details section',
      args: [],
    );
  }

  /// `Bank Account Owner`
  String get bankAccountOwner {
    return Intl.message(
      'Bank Account Owner',
      name: 'bankAccountOwner',
      desc: 'Label for bank account owner in user information section',
      args: [],
    );
  }

  /// `Edit Data`
  String get editData {
    return Intl.message(
      'Edit Data',
      name: 'editData',
      desc: 'Label for editing data button',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: 'Label for changing password button',
      args: [],
    );
  }

  /// `Account Information`
  String get accountInformation {
    return Intl.message(
      'Account Information',
      name: 'accountInformation',
      desc: 'Label for account information section',
      args: [],
    );
  }

  /// `Account Information Details`
  String get accountInformationDetails {
    return Intl.message(
      'Account Information Details',
      name: 'accountInformationDetails',
      desc: 'Label for account information details section',
      args: [],
    );
  }

  /// `Business Name`
  String get businessName {
    return Intl.message(
      'Business Name',
      name: 'businessName',
      desc: 'Label for business name in account information section',
      args: [],
    );
  }

  /// `Subscription Tier`
  String get subscriptionTier {
    return Intl.message(
      'Subscription Tier',
      name: 'subscriptionTier',
      desc: 'Label for subscription tier in account information section',
      args: [],
    );
  }

  /// `Manage Subscription`
  String get manageSubscription {
    return Intl.message(
      'Manage Subscription',
      name: 'manageSubscription',
      desc: 'Label for manage subscription button',
      args: [],
    );
  }

  /// `Account Details`
  String get accountDetails {
    return Intl.message(
      'Account Details',
      name: 'accountDetails',
      desc: 'Label for account details section',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPasswordTitle {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPasswordTitle',
      desc: 'Title for forgot password section',
      args: [],
    );
  }

  /// `Worker assigned successfully`
  String get workerAssignedSuccessfully {
    return Intl.message(
      'Worker assigned successfully',
      name: 'workerAssignedSuccessfully',
      desc: 'Success message when worker is assigned successfully',
      args: [],
    );
  }

  /// `Are you sure you want to assign this worker?`
  String get confirmAssignWorker {
    return Intl.message(
      'Are you sure you want to assign this worker?',
      name: 'confirmAssignWorker',
      desc: 'Confirmation message for assigning worker',
      args: [],
    );
  }

  /// `This change will be recorded in this worker’s historial.`
  String get confirmAssignWorkerMessage {
    return Intl.message(
      'This change will be recorded in this worker’s historial.',
      name: 'confirmAssignWorkerMessage',
      desc: 'Confirmation message for assigning worker',
      args: [],
    );
  }

  /// `Worker unassigned successfully`
  String get workerUnassignedSuccessfully {
    return Intl.message(
      'Worker unassigned successfully',
      name: 'workerUnassignedSuccessfully',
      desc: 'Success message when worker is unassigned successfully',
      args: [],
    );
  }

  /// `Confirm`
  String get workerAssignConfirm {
    return Intl.message(
      'Confirm',
      name: 'workerAssignConfirm',
      desc: 'Confirmation message for unassigning worker',
      args: [],
    );
  }

  /// `Reassign worker`
  String get reassignWorker {
    return Intl.message(
      'Reassign worker',
      name: 'reassignWorker',
      desc: 'Label for reassigning worker',
      args: [],
    );
  }

  /// `Worker reassigned successfully`
  String get workerReassigned {
    return Intl.message(
      'Worker reassigned successfully',
      name: 'workerReassigned',
      desc: 'Success message when worker is reassigned successfully',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: 'Label for reset password button',
      args: [],
    );
  }

  /// `Back to login`
  String get backToLogin {
    return Intl.message(
      'Back to login',
      name: 'backToLogin',
      desc: 'Label for back to login button',
      args: [],
    );
  }

  /// `Password Reset Code`
  String get passwordResetCodeTitle {
    return Intl.message(
      'Password Reset Code',
      name: 'passwordResetCodeTitle',
      desc: 'Title for password reset code section',
      args: [],
    );
  }

  /// `Password Reset Code`
  String get passwordResetCode {
    return Intl.message(
      'Password Reset Code',
      name: 'passwordResetCode',
      desc: 'Label for password reset code section',
      args: [],
    );
  }

  /// `Verify Code`
  String get verifyCode {
    return Intl.message(
      'Verify Code',
      name: 'verifyCode',
      desc: 'Label for verify code button',
      args: [],
    );
  }

  /// `Set New Password`
  String get setNewPasswordTitle {
    return Intl.message(
      'Set New Password',
      name: 'setNewPasswordTitle',
      desc: 'Title for set new password section',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: 'Label for new password section',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: 'Label for confirm password section',
      args: [],
    );
  }

  /// `Set New Password`
  String get setNewPassword {
    return Intl.message(
      'Set New Password',
      name: 'setNewPassword',
      desc: 'Label for set new password button',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: 'Error message when email is required',
      args: [],
    );
  }

  /// `Code must be 5 characters long`
  String get codeLength {
    return Intl.message(
      'Code must be 5 characters long',
      name: 'codeLength',
      desc: 'Error message when code is not 5 characters long',
      args: [],
    );
  }

  /// `Code is required`
  String get codeRequired {
    return Intl.message(
      'Code is required',
      name: 'codeRequired',
      desc: 'Error message when code is required',
      args: [],
    );
  }

  /// `New password is required`
  String get newPasswordRequired {
    return Intl.message(
      'New password is required',
      name: 'newPasswordRequired',
      desc: 'Error message when new password is required',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get passwordLength {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'passwordLength',
      desc: 'Error message when password is less than 8 characters long',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: 'Error message when passwords do not match',
      args: [],
    );
  }

  /// `Confirm password is required`
  String get confirmPasswordRequired {
    return Intl.message(
      'Confirm password is required',
      name: 'confirmPasswordRequired',
      desc: 'Error message when confirm password is required',
      args: [],
    );
  }

  /// `Change template`
  String get changeTemplate {
    return Intl.message(
      'Change template',
      name: 'changeTemplate',
      desc: 'Label for changing template',
      args: [],
    );
  }

  /// `Ammonia (NH₃)`
  String get ammonia {
    return Intl.message(
      'Ammonia (NH₃)',
      name: 'ammonia',
      desc: 'Label for ammonia and sulfer dioxide',
      args: [],
    );
  }

  /// `Sulfur dioxide (SO₂)`
  String get sulfurDioxide {
    return Intl.message(
      'Sulfur dioxide (SO₂)',
      name: 'sulfurDioxide',
      desc: 'Label for ammonia and sulfer dioxide',
      args: [],
    );
  }

  /// `Template Configuration`
  String get templateConfiguration {
    return Intl.message(
      'Template Configuration',
      name: 'templateConfiguration',
      desc: 'Label for template configuration',
      args: [],
    );
  }

  /// `Edit container`
  String get editContainer {
    return Intl.message(
      'Edit container',
      name: 'editContainer',
      desc: 'Label for editing container',
      args: [],
    );
  }

  /// `Container description`
  String get containerDescription {
    return Intl.message(
      'Container description',
      name: 'containerDescription',
      desc: 'Label for container description',
      args: [],
    );
  }

  /// `Detect gases`
  String get detectGases {
    return Intl.message(
      'Detect gases',
      name: 'detectGases',
      desc: 'Label for detecting gases',
      args: [],
    );
  }

  /// `Last known health status`
  String get lastKnownHealthStatus {
    return Intl.message(
      'Last known health status',
      name: 'lastKnownHealthStatus',
      desc: 'Label for last known health status',
      args: [],
    );
  }

  /// `You don't have any Dittobox containers yet`
  String get containersNotFound {
    return Intl.message(
      'You don\'t have any Dittobox containers yet',
      name: 'containersNotFound',
      desc: 'Error message when containers are not found',
      args: [],
    );
  }

  /// `No facilities available`
  String get noFacilitiesAvailable {
    return Intl.message(
      'No facilities available',
      name: 'noFacilitiesAvailable',
      desc: 'Error message when no facilities are available',
      args: [],
    );
  }

  /// `Container created successfully`
  String get containerCreatedSuccessfully {
    return Intl.message(
      'Container created successfully',
      name: 'containerCreatedSuccessfully',
      desc: 'Success message when container is created successfully',
      args: [],
    );
  }

  /// `All containers`
  String get allContainers {
    return Intl.message(
      'All containers',
      name: 'allContainers',
      desc: 'Label for all containers',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: 'Label for details',
      args: [],
    );
  }

  /// `Max sulfur dioxide`
  String get sulfurDioxideMax {
    return Intl.message(
      'Max sulfur dioxide',
      name: 'sulfurDioxideMax',
      desc: 'Label for Max sulfur dioxide section',
      args: [],
    );
  }

  /// `Min sulfur dioxide`
  String get sulfurDioxideMin {
    return Intl.message(
      'Min sulfur dioxide',
      name: 'sulfurDioxideMin',
      desc: 'Label for Min sulfur dioxide section',
      args: [],
    );
  }

  /// `View current configs`
  String get viewCurrentConfigs {
    return Intl.message(
      'View current configs',
      name: 'viewCurrentConfigs',
      desc: 'Label for viewing current configurations',
      args: [],
    );
  }

  /// `Current configurations`
  String get currentConfigs {
    return Intl.message(
      'Current configurations',
      name: 'currentConfigs',
      desc: 'Label for current configurations',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: 'Button label for closing',
      args: [],
    );
  }

  /// `No template assigned`
  String get noTemplateAssigned {
    return Intl.message(
      'No template assigned',
      name: 'noTemplateAssigned',
      desc: 'Error message when no template is assigned',
      args: [],
    );
  }

  /// `Assign template?`
  String get assignTemplate {
    return Intl.message(
      'Assign template?',
      name: 'assignTemplate',
      desc: 'Label for assigning template',
      args: [],
    );
  }

  /// `Select template`
  String get selectTemplate {
    return Intl.message(
      'Select template',
      name: 'selectTemplate',
      desc: 'Label for selecting template',
      args: [],
    );
  }

  /// `Template assigned successfully`
  String get templateAssignedSuccessfully {
    return Intl.message(
      'Template assigned successfully',
      name: 'templateAssignedSuccessfully',
      desc: 'Success message when template is assigned successfully',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: 'Label for success',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: 'Button label for ok',
      args: [],
    );
  }

  /// `Are you sure you want to grant this privilege?`
  String get areYouSureYouWantToGrantThisPrivilege {
    return Intl.message(
      'Are you sure you want to grant this privilege?',
      name: 'areYouSureYouWantToGrantThisPrivilege',
      desc: 'Confirmation message for granting privilege',
      args: [],
    );
  }

  /// `Are you sure you want to revoke this privilege?`
  String get areYouSureYouWantToRevokeThisPrivilege {
    return Intl.message(
      'Are you sure you want to revoke this privilege?',
      name: 'areYouSureYouWantToRevokeThisPrivilege',
      desc: 'Confirmation message for revoking privilege',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: 'Button label for confirming',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: 'Label for location',
      args: [],
    );
  }

  /// `Privileges updated successfully`
  String get privilegesUpdatedSuccessfully {
    return Intl.message(
      'Privileges updated successfully',
      name: 'privilegesUpdatedSuccessfully',
      desc: 'Success message when privileges are updated successfully',
      args: [],
    );
  }

  /// `Failed to update privileges`
  String get failedToUpdatePrivileges {
    return Intl.message(
      'Failed to update privileges',
      name: 'failedToUpdatePrivileges',
      desc: 'Error message when failing to update privileges',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: 'Label for status',
      args: [],
    );
  }

  /// `Next payment day`
  String get nextPaymentDay {
    return Intl.message(
      'Next payment day',
      name: 'nextPaymentDay',
      desc: 'Label for next payment day',
      args: [],
    );
  }

  /// `Update`
  String get updatePaymentInformation {
    return Intl.message(
      'Update',
      name: 'updatePaymentInformation',
      desc: 'Button label for updating payment information',
      args: [],
    );
  }

  /// `Card number`
  String get cardNumber {
    return Intl.message(
      'Card number',
      name: 'cardNumber',
      desc: 'Label for card number',
      args: [],
    );
  }

  /// `Expiration date`
  String get expirationDate {
    return Intl.message(
      'Expiration date',
      name: 'expirationDate',
      desc: 'Label for expiration date',
      args: [],
    );
  }

  /// `Payment successful`
  String get paymentSuccessful {
    return Intl.message(
      'Payment successful',
      name: 'paymentSuccessful',
      desc: 'Success message when payment is successful',
      args: [],
    );
  }

  /// `Advance Plan`
  String get advancePlan {
    return Intl.message(
      'Advance Plan',
      name: 'advancePlan',
      desc: 'Label for Advance Plan',
      args: [],
    );
  }

  /// `Premium Plan`
  String get premiumPlan {
    return Intl.message(
      'Premium Plan',
      name: 'premiumPlan',
      desc: 'Label for Premium Plan',
      args: [],
    );
  }

  /// `Up to`
  String get upTo {
    return Intl.message(
      'Up to',
      name: 'upTo',
      desc: 'Label for up to',
      args: [],
    );
  }

  /// `Restaurants`
  String get restaurants {
    return Intl.message(
      'Restaurants',
      name: 'restaurants',
      desc: 'Label for restaurants',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: 'Label for month',
      args: [],
    );
  }

  /// `Yearly`
  String get yearly {
    return Intl.message(
      'Yearly',
      name: 'yearly',
      desc: 'Label for yearly',
      args: [],
    );
  }

  /// `All from Starter Plan`
  String get allFromStarterPlan {
    return Intl.message(
      'All from Starter Plan',
      name: 'allFromStarterPlan',
      desc: 'Label for all from Starter Plan',
      args: [],
    );
  }

  /// `Priority technical support`
  String get priorityTechnicalSupport {
    return Intl.message(
      'Priority technical support',
      name: 'priorityTechnicalSupport',
      desc: 'Label for priority technical support',
      args: [],
    );
  }

  /// `Automatic templates to adjust temperature and humidity according to the type of supply.`
  String get automaticTemplates {
    return Intl.message(
      'Automatic templates to adjust temperature and humidity according to the type of supply.',
      name: 'automaticTemplates',
      desc:
          'Label for automatic templates to adjust temperature and humidity according to the type of supply',
      args: [],
    );
  }

  /// `Simultaneous monitoring of up to 5 DittoBoxes for multiple restaurants.`
  String get simultaneousMonitoring {
    return Intl.message(
      'Simultaneous monitoring of up to 5 DittoBoxes for multiple restaurants.',
      name: 'simultaneousMonitoring',
      desc:
          'Label for simultaneous monitoring of up to 5 DittoBoxes for multiple restaurants',
      args: [],
    );
  }

  /// `All from Advance Plan`
  String get allFromAdvancePlan {
    return Intl.message(
      'All from Advance Plan',
      name: 'allFromAdvancePlan',
      desc: 'Label for all from Advance Plan',
      args: [],
    );
  }

  /// `Support for larger chains (up to 10 restaurants).`
  String get supportForLargerChains {
    return Intl.message(
      'Support for larger chains (up to 10 restaurants).',
      name: 'supportForLargerChains',
      desc: 'Label for support for larger chains (up to 10 restaurants)',
      args: [],
    );
  }

  /// `Faster and more personalized technical support.`
  String get fasterTechnicalSupport {
    return Intl.message(
      'Faster and more personalized technical support.',
      name: 'fasterTechnicalSupport',
      desc: 'Label for faster and more personalized technical support',
      args: [],
    );
  }

  /// `Advanced automatic templates and adjustments for preserving various types of food.`
  String get advancedAutomaticTemplates {
    return Intl.message(
      'Advanced automatic templates and adjustments for preserving various types of food.',
      name: 'advancedAutomaticTemplates',
      desc:
          'Label for advanced automatic templates and adjustments for preserving various types of food',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: 'Button label for paying',
      args: [],
    );
  }

  /// `Subscription Plans`
  String get subscriptionPlans {
    return Intl.message(
      'Subscription Plans',
      name: 'subscriptionPlans',
      desc: 'Label for subscription plans',
      args: [],
    );
  }

  /// `Subscribe`
  String get subscribe {
    return Intl.message(
      'Subscribe',
      name: 'subscribe',
      desc: 'Button label for subscribing',
      args: [],
    );
  }

  /// `Choose plan`
  String get choosePlan {
    return Intl.message(
      'Choose plan',
      name: 'choosePlan',
      desc: 'Label for choosing plan',
      args: [],
    );
  }

  /// `Yearly plans`
  String get yearlyPlans {
    return Intl.message(
      'Yearly plans',
      name: 'yearlyPlans',
      desc: 'Label for yearly plans',
      args: [],
    );
  }

  /// `Monthly plans`
  String get monthlyPlans {
    return Intl.message(
      'Monthly plans',
      name: 'monthlyPlans',
      desc: 'Label for monthly plans',
      args: [],
    );
  }

  /// `Invalid card number`
  String get invalidCardNumber {
    return Intl.message(
      'Invalid card number',
      name: 'invalidCardNumber',
      desc: 'Error message when card number is invalid',
      args: [],
    );
  }

  /// `Invalid expiry date`
  String get invalidExpiryDate {
    return Intl.message(
      'Invalid expiry date',
      name: 'invalidExpiryDate',
      desc: 'Error message when expiry date is invalid',
      args: [],
    );
  }

  /// `Invalid CVV`
  String get invalidCvv {
    return Intl.message(
      'Invalid CVV',
      name: 'invalidCvv',
      desc: 'Error message when CVV is invalid',
      args: [],
    );
  }

  /// `Invalid card holder name`
  String get invalidCardHolderName {
    return Intl.message(
      'Invalid card holder name',
      name: 'invalidCardHolderName',
      desc: 'Error message when card holder name is invalid',
      args: [],
    );
  }

  /// `Facility created successfully`
  String get facilityCreatedSuccessfully {
    return Intl.message(
      'Facility created successfully',
      name: 'facilityCreatedSuccessfully',
      desc: 'Success message when facility is created successfully',
      args: [],
    );
  }

  /// `Login failed`
  String get loginFailed {
    return Intl.message(
      'Login failed',
      name: 'loginFailed',
      desc: 'Error message when login fails',
      args: [],
    );
  }

  /// `Registration failed`
  String get registrationFailed {
    return Intl.message(
      'Registration failed',
      name: 'registrationFailed',
      desc: 'Error message when registration fails',
      args: [],
    );
  }

  /// `Account created successfully`
  String get accountCreatedSuccessfully {
    return Intl.message(
      'Account created successfully',
      name: 'accountCreatedSuccessfully',
      desc: 'Success message when account is created successfully',
      args: [],
    );
  }

  /// `Error creating account`
  String get errorCreatingAccount {
    return Intl.message(
      'Error creating account',
      name: 'errorCreatingAccount',
      desc: 'Error message when account creation fails',
      args: [],
    );
  }

  /// `You don't have any facilities yet, please add one`
  String get noFacilitiesFound {
    return Intl.message(
      'You don\'t have any facilities yet, please add one',
      name: 'noFacilitiesFound',
      desc: 'Error message when no facilities are found',
      args: [],
    );
  }

  /// `Error applicating a template`
  String get errorApplicatingaTemplate {
    return Intl.message(
      'Error applicating a template',
      name: 'errorApplicatingaTemplate',
      desc: 'Error message when applying a template fails',
      args: [],
    );
  }

  /// `The temperature in {name} has exceeded the allowed threshold.`
  String temperatureThresholdExceeded(String name) {
    return Intl.message(
      'The temperature in $name has exceeded the allowed threshold.',
      name: 'temperatureThresholdExceeded',
      desc: 'Error message when temperature threshold is exceeded',
      args: [name],
    );
  }

  /// `The humidity in {name} has exceeded the allowed threshold.`
  String humidityThresholdExceeded(String name) {
    return Intl.message(
      'The humidity in $name has exceeded the allowed threshold.',
      name: 'humidityThresholdExceeded',
      desc: 'Error message when humidity threshold is exceeded',
      args: [name],
    );
  }

  /// `Decomposition gases have been detected in {name}.`
  String decompositionGasesDetected(String name) {
    return Intl.message(
      'Decomposition gases have been detected in $name.',
      name: 'decompositionGasesDetected',
      desc: 'Error message when decomposition gases are detected',
      args: [name],
    );
  }

  /// `The container {name} has been linked.`
  String containerLinked(String name) {
    return Intl.message(
      'The container $name has been linked.',
      name: 'containerLinked',
      desc: 'Success message when container is linked',
      args: [name],
    );
  }

  /// `The container {name} has been unlinked.`
  String containerUnlinked(String name) {
    return Intl.message(
      'The container $name has been unlinked.',
      name: 'containerUnlinked',
      desc: 'Success message when container is unlinked',
      args: [name],
    );
  }

  /// `The container {name} is off.`
  String containerOff(String name) {
    return Intl.message(
      'The container $name is off.',
      name: 'containerOff',
      desc: 'Error message when container is off',
      args: [name],
    );
  }

  /// `The container {name} is on.`
  String containerOn(String name) {
    return Intl.message(
      'The container $name is on.',
      name: 'containerOn',
      desc: 'Success message when container is on',
      args: [name],
    );
  }

  /// `A template has been assigned to the container {name}.`
  String templateAssigned(String name) {
    return Intl.message(
      'A template has been assigned to the container $name.',
      name: 'templateAssigned',
      desc: 'Success message when template is assigned',
      args: [name],
    );
  }

  /// `The container {name} has been activated.`
  String containerActivated(String name) {
    return Intl.message(
      'The container $name has been activated.',
      name: 'containerActivated',
      desc: 'Success message when container is activated',
      args: [name],
    );
  }

  /// `The container {name} has been deactivated.`
  String containerDeactivated(String name) {
    return Intl.message(
      'The container $name has been deactivated.',
      name: 'containerDeactivated',
      desc: 'Success message when container is deactivated',
      args: [name],
    );
  }

  /// `Temperature regulation has been triggered in {name}.`
  String temperatureRegulationTriggered(String name) {
    return Intl.message(
      'Temperature regulation has been triggered in $name.',
      name: 'temperatureRegulationTriggered',
      desc: 'Error message when temperature regulation is triggered',
      args: [name],
    );
  }

  /// `Temperature regulation in {name} was successful.`
  String temperatureRegulationSuccessful(String name) {
    return Intl.message(
      'Temperature regulation in $name was successful.',
      name: 'temperatureRegulationSuccessful',
      desc: 'Success message when temperature regulation is successful',
      args: [name],
    );
  }

  /// `Temperature regulation in {name} has failed.`
  String temperatureRegulationFailed(String name) {
    return Intl.message(
      'Temperature regulation in $name has failed.',
      name: 'temperatureRegulationFailed',
      desc: 'Error message when temperature regulation fails',
      args: [name],
    );
  }

  /// `Humidity regulation has been triggered in {name}.`
  String humidityRegulationTriggered(String name) {
    return Intl.message(
      'Humidity regulation has been triggered in $name.',
      name: 'humidityRegulationTriggered',
      desc: 'Error message when humidity regulation is triggered',
      args: [name],
    );
  }

  /// `Humidity regulation in {name} was successful.`
  String humidityRegulationSuccessful(String name) {
    return Intl.message(
      'Humidity regulation in $name was successful.',
      name: 'humidityRegulationSuccessful',
      desc: 'Success message when humidity regulation is successful',
      args: [name],
    );
  }

  /// `Humidity regulation in {name} has failed.`
  String humidityRegulationFailed(String name) {
    return Intl.message(
      'Humidity regulation in $name has failed.',
      name: 'humidityRegulationFailed',
      desc: 'Error message when humidity regulation fails',
      args: [name],
    );
  }

  /// `Ventilation regulation has been triggered in {name}.`
  String ventilationRegulationTriggered(String name) {
    return Intl.message(
      'Ventilation regulation has been triggered in $name.',
      name: 'ventilationRegulationTriggered',
      desc: 'Error message when ventilation regulation is triggered',
      args: [name],
    );
  }

  /// `Ventilation regulation in {name} was successful.`
  String ventilationRegulationSuccessful(String name) {
    return Intl.message(
      'Ventilation regulation in $name was successful.',
      name: 'ventilationRegulationSuccessful',
      desc: 'Success message when ventilation regulation is successful',
      args: [name],
    );
  }

  /// `Ventilation regulation in {name} has failed.`
  String ventilationRegulationFailed(String name) {
    return Intl.message(
      'Ventilation regulation in $name has failed.',
      name: 'ventilationRegulationFailed',
      desc: 'Error message when ventilation regulation fails',
      args: [name],
    );
  }

  /// `Health report of the container {name}.`
  String containerHealthReport(String name) {
    return Intl.message(
      'Health report of the container $name.',
      name: 'containerHealthReport',
      desc: 'Label for container health report',
      args: [name],
    );
  }

  /// `Status report of the container {name}.`
  String containerStatusReport(String name) {
    return Intl.message(
      'Status report of the container $name.',
      name: 'containerStatusReport',
      desc: 'Label for container status report',
      args: [name],
    );
  }

  /// `The container {name} has been manually turned on.`
  String containerManualOn(String name) {
    return Intl.message(
      'The container $name has been manually turned on.',
      name: 'containerManualOn',
      desc: 'Success message when container is manually turned on',
      args: [name],
    );
  }

  /// `The container {name} has been manually turned off.`
  String containerManualOff(String name) {
    return Intl.message(
      'The container $name has been manually turned off.',
      name: 'containerManualOff',
      desc: 'Success message when container is manually turned off',
      args: [name],
    );
  }

  /// `The container {name} has been opened.`
  String containerOpened(String name) {
    return Intl.message(
      'The container $name has been opened.',
      name: 'containerOpened',
      desc: 'Error message when container is opened',
      args: [name],
    );
  }

  /// `The container {name} is online.`
  String containerOnline(String name) {
    return Intl.message(
      'The container $name is online.',
      name: 'containerOnline',
      desc: 'Success message when container is online',
      args: [name],
    );
  }

  /// `The container {name} is offline.`
  String containerOffline(String name) {
    return Intl.message(
      'The container $name is offline.',
      name: 'containerOffline',
      desc: 'Error message when container is offline',
      args: [name],
    );
  }

  /// `Unknown alert in {name}.`
  String unknownAlert(String name) {
    return Intl.message(
      'Unknown alert in $name.',
      name: 'unknownAlert',
      desc: 'Error message when alert is unknown',
      args: [name],
    );
  }

  /// `Alert: {alertType}`
  String alert(String alertType) {
    return Intl.message(
      'Alert: $alertType',
      name: 'alert',
      desc: 'Label for alert',
      args: [alertType],
    );
  }

  /// `Issued at: {issuedAt}`
  String issuedAt(String issuedAt) {
    return Intl.message(
      'Issued at: $issuedAt',
      name: 'issuedAt',
      desc: 'Label for issued at',
      args: [issuedAt],
    );
  }

  /// `Temperature Threshold Exceeded`
  String get temperatureThresholdExceededTitle {
    return Intl.message(
      'Temperature Threshold Exceeded',
      name: 'temperatureThresholdExceededTitle',
      desc: 'Title for temperature threshold exceeded',
      args: [],
    );
  }

  /// `Humidity Threshold Exceeded`
  String get humidityThresholdExceededTitle {
    return Intl.message(
      'Humidity Threshold Exceeded',
      name: 'humidityThresholdExceededTitle',
      desc: 'Title for humidity threshold exceeded',
      args: [],
    );
  }

  /// `Decomposition Gases Detected`
  String get decompositionGasesDetectedTitle {
    return Intl.message(
      'Decomposition Gases Detected',
      name: 'decompositionGasesDetectedTitle',
      desc: 'Title for decomposition gases detected',
      args: [],
    );
  }

  /// `Container Linked`
  String get containerLinkedTitle {
    return Intl.message(
      'Container Linked',
      name: 'containerLinkedTitle',
      desc: 'Title for container linked',
      args: [],
    );
  }

  /// `Container Unlinked`
  String get containerUnlinkedTitle {
    return Intl.message(
      'Container Unlinked',
      name: 'containerUnlinkedTitle',
      desc: 'Title for container unlinked',
      args: [],
    );
  }

  /// `Container Off`
  String get containerOffTitle {
    return Intl.message(
      'Container Off',
      name: 'containerOffTitle',
      desc: 'Title for container off',
      args: [],
    );
  }

  /// `Container On`
  String get containerOnTitle {
    return Intl.message(
      'Container On',
      name: 'containerOnTitle',
      desc: 'Title for container on',
      args: [],
    );
  }

  /// `Template Assigned`
  String get templateAssignedTitle {
    return Intl.message(
      'Template Assigned',
      name: 'templateAssignedTitle',
      desc: 'Title for template assigned',
      args: [],
    );
  }

  /// `Container Activated`
  String get containerActivatedTitle {
    return Intl.message(
      'Container Activated',
      name: 'containerActivatedTitle',
      desc: 'Title for container activated',
      args: [],
    );
  }

  /// `Container Deactivated`
  String get containerDeactivatedTitle {
    return Intl.message(
      'Container Deactivated',
      name: 'containerDeactivatedTitle',
      desc: 'Title for container deactivated',
      args: [],
    );
  }

  /// `Temperature Regulation Triggered`
  String get temperatureRegulationTriggeredTitle {
    return Intl.message(
      'Temperature Regulation Triggered',
      name: 'temperatureRegulationTriggeredTitle',
      desc: 'Title for temperature regulation triggered',
      args: [],
    );
  }

  /// `Temperature Regulation Successful`
  String get temperatureRegulationSuccessfulTitle {
    return Intl.message(
      'Temperature Regulation Successful',
      name: 'temperatureRegulationSuccessfulTitle',
      desc: 'Title for temperature regulation successful',
      args: [],
    );
  }

  /// `Temperature Regulation Failed`
  String get temperatureRegulationFailedTitle {
    return Intl.message(
      'Temperature Regulation Failed',
      name: 'temperatureRegulationFailedTitle',
      desc: 'Title for temperature regulation failed',
      args: [],
    );
  }

  /// `Humidity Regulation Triggered`
  String get humidityRegulationTriggeredTitle {
    return Intl.message(
      'Humidity Regulation Triggered',
      name: 'humidityRegulationTriggeredTitle',
      desc: 'Title for humidity regulation triggered',
      args: [],
    );
  }

  /// `Humidity Regulation Successful`
  String get humidityRegulationSuccessfulTitle {
    return Intl.message(
      'Humidity Regulation Successful',
      name: 'humidityRegulationSuccessfulTitle',
      desc: 'Title for humidity regulation successful',
      args: [],
    );
  }

  /// `Humidity Regulation Failed`
  String get humidityRegulationFailedTitle {
    return Intl.message(
      'Humidity Regulation Failed',
      name: 'humidityRegulationFailedTitle',
      desc: 'Title for humidity regulation failed',
      args: [],
    );
  }

  /// `Ventilation Regulation Triggered`
  String get ventilationRegulationTriggeredTitle {
    return Intl.message(
      'Ventilation Regulation Triggered',
      name: 'ventilationRegulationTriggeredTitle',
      desc: 'Title for ventilation regulation triggered',
      args: [],
    );
  }

  /// `Ventilation Regulation Successful`
  String get ventilationRegulationSuccessfulTitle {
    return Intl.message(
      'Ventilation Regulation Successful',
      name: 'ventilationRegulationSuccessfulTitle',
      desc: 'Title for ventilation regulation successful',
      args: [],
    );
  }

  /// `Ventilation Regulation Failed`
  String get ventilationRegulationFailedTitle {
    return Intl.message(
      'Ventilation Regulation Failed',
      name: 'ventilationRegulationFailedTitle',
      desc: 'Title for ventilation regulation failed',
      args: [],
    );
  }

  /// `Container Health Report`
  String get containerHealthReportTitle {
    return Intl.message(
      'Container Health Report',
      name: 'containerHealthReportTitle',
      desc: 'Title for container health report',
      args: [],
    );
  }

  /// `Container Status Report`
  String get containerStatusReportTitle {
    return Intl.message(
      'Container Status Report',
      name: 'containerStatusReportTitle',
      desc: 'Title for container status report',
      args: [],
    );
  }

  /// `Container Manual On`
  String get containerManualOnTitle {
    return Intl.message(
      'Container Manual On',
      name: 'containerManualOnTitle',
      desc: 'Title for container manual on',
      args: [],
    );
  }

  /// `Container Manual Off`
  String get containerManualOffTitle {
    return Intl.message(
      'Container Manual Off',
      name: 'containerManualOffTitle',
      desc: 'Title for container manual off',
      args: [],
    );
  }

  /// `Container Opened`
  String get containerOpenedTitle {
    return Intl.message(
      'Container Opened',
      name: 'containerOpenedTitle',
      desc: 'Title for container opened',
      args: [],
    );
  }

  /// `Container Online`
  String get containerOnlineTitle {
    return Intl.message(
      'Container Online',
      name: 'containerOnlineTitle',
      desc: 'Title for container online',
      args: [],
    );
  }

  /// `Container Offline`
  String get containerOfflineTitle {
    return Intl.message(
      'Container Offline',
      name: 'containerOfflineTitle',
      desc: 'Title for container offline',
      args: [],
    );
  }

  /// `Unknown Alert`
  String get unknownAlertTitle {
    return Intl.message(
      'Unknown Alert',
      name: 'unknownAlertTitle',
      desc: 'Title for unknown alert',
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
