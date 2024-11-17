// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(alertType) => "Alert: ${alertType}";

  static String m1(name) => "The container ${name} has been activated.";

  static String m2(name) => "The container ${name} has been deactivated.";

  static String m3(name) => "Health report of the container ${name}.";

  static String m4(name) => "The container ${name} has been linked.";

  static String m5(name) =>
      "The container ${name} has been manually turned off.";

  static String m6(name) =>
      "The container ${name} has been manually turned on.";

  static String m7(name) => "The container ${name} is off.";

  static String m8(name) => "The container ${name} is offline.";

  static String m9(name) => "The container ${name} is on.";

  static String m10(name) => "The container ${name} is online.";

  static String m11(name) => "The container ${name} has been opened.";

  static String m12(name) => "Status report of the container ${name}.";

  static String m13(name) => "The container ${name} has been unlinked.";

  static String m14(name) =>
      "Decomposition gases have been detected in ${name}.";

  static String m15(name) => "Humidity regulation in ${name} has failed.";

  static String m16(name) => "Humidity regulation in ${name} was successful.";

  static String m17(name) =>
      "Humidity regulation has been triggered in ${name}.";

  static String m18(name) =>
      "The humidity in ${name} has exceeded the allowed threshold.";

  static String m19(issuedAt) => "Issued at: ${issuedAt}";

  static String m20(name) => "Temperature regulation in ${name} has failed.";

  static String m21(name) =>
      "Temperature regulation in ${name} was successful.";

  static String m22(name) =>
      "Temperature regulation has been triggered in ${name}.";

  static String m23(name) =>
      "The temperature in ${name} has exceeded the allowed threshold.";

  static String m24(name) =>
      "A template has been assigned to the container ${name}.";

  static String m25(name) =>
      "Template assigned successfully to container ${name}.";

  static String m26(name) => "Unknown alert in ${name}.";

  static String m27(name) => "Ventilation regulation in ${name} has failed.";

  static String m28(name) =>
      "Ventilation regulation in ${name} was successful.";

  static String m29(name) =>
      "Ventilation regulation has been triggered in ${name}.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "All": MessageLookupByLibrary.simpleMessage("All"),
        "AnimalDerived": MessageLookupByLibrary.simpleMessage("Animal Derived"),
        "Meats": MessageLookupByLibrary.simpleMessage("Meats"),
        "ProcessedFood": MessageLookupByLibrary.simpleMessage("Processed Food"),
        "Produce": MessageLookupByLibrary.simpleMessage("Produce"),
        "aboutYourCompany":
            MessageLookupByLibrary.simpleMessage("About your company"),
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "accountCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Account created successfully"),
        "accountDetails":
            MessageLookupByLibrary.simpleMessage("Account Details"),
        "accountInformation":
            MessageLookupByLibrary.simpleMessage("Account Information"),
        "accountInformationDetails":
            MessageLookupByLibrary.simpleMessage("Account Information Details"),
        "active": MessageLookupByLibrary.simpleMessage("Active"),
        "addContainer": MessageLookupByLibrary.simpleMessage("Add container"),
        "addContainers": MessageLookupByLibrary.simpleMessage("Add containers"),
        "addTemplate": MessageLookupByLibrary.simpleMessage("Add template"),
        "addWorker": MessageLookupByLibrary.simpleMessage("Add worker"),
        "addWorkers": MessageLookupByLibrary.simpleMessage("Add workers"),
        "advancePlan": MessageLookupByLibrary.simpleMessage("Advance Plan"),
        "advancedAutomaticTemplates": MessageLookupByLibrary.simpleMessage(
            "Advanced automatic templates and adjustments for preserving various types of food."),
        "alert": m0,
        "alerts": MessageLookupByLibrary.simpleMessage("Alerts"),
        "all": MessageLookupByLibrary.simpleMessage("All"),
        "allContainers": MessageLookupByLibrary.simpleMessage("All containers"),
        "allFromAdvancePlan":
            MessageLookupByLibrary.simpleMessage("All from Advance Plan"),
        "allFromStarterPlan":
            MessageLookupByLibrary.simpleMessage("All from Starter Plan"),
        "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
            "Already have an account? Login instead"),
        "ammonia": MessageLookupByLibrary.simpleMessage("Ammonia (NH₃)"),
        "ammoniaAndSulfurDioxide":
            MessageLookupByLibrary.simpleMessage("Ammonia and sulfur dioxide"),
        "ammoniaAndSulfurDioxideMax": MessageLookupByLibrary.simpleMessage(
            "Max ammonia and sulfur dioxide"),
        "ammoniaAndSulfurDioxideMin": MessageLookupByLibrary.simpleMessage(
            "Min ammonia and sulfur dioxide"),
        "ammoniaMax": MessageLookupByLibrary.simpleMessage("Max ammonia"),
        "ammoniaMin": MessageLookupByLibrary.simpleMessage("Min ammonia"),
        "animalDerived": MessageLookupByLibrary.simpleMessage("Animal derived"),
        "applyTemplate": MessageLookupByLibrary.simpleMessage("Apply"),
        "areYouSureDelete": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete this?"),
        "areYouSureYouWantToGrantThisPrivilege":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to grant this privilege?"),
        "areYouSureYouWantToRevokeThisPrivilege":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to revoke this privilege?"),
        "assignTemplate":
            MessageLookupByLibrary.simpleMessage("Assign template?"),
        "automaticTemplates": MessageLookupByLibrary.simpleMessage(
            "Automatic templates to adjust temperature and humidity according to the type of supply."),
        "backToLogin": MessageLookupByLibrary.simpleMessage("Back to login"),
        "bankAccountOwner":
            MessageLookupByLibrary.simpleMessage("Bank Account Owner"),
        "businessName": MessageLookupByLibrary.simpleMessage("Business Name"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cancelSubscription":
            MessageLookupByLibrary.simpleMessage("Cancel subscription"),
        "carbonDioxide":
            MessageLookupByLibrary.simpleMessage("Carbon dioxide (CO₂)"),
        "carbonDioxideMax":
            MessageLookupByLibrary.simpleMessage("Max carbon dioxide"),
        "carbonDioxideMin":
            MessageLookupByLibrary.simpleMessage("Min carbon dioxide"),
        "cardNumber": MessageLookupByLibrary.simpleMessage("Card number"),
        "category": MessageLookupByLibrary.simpleMessage("Category"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "changeTemplate":
            MessageLookupByLibrary.simpleMessage("Change template"),
        "changeToEnglish":
            MessageLookupByLibrary.simpleMessage("Change to English"),
        "changeToSpanish":
            MessageLookupByLibrary.simpleMessage("Change to Spanish"),
        "checkAlerts": MessageLookupByLibrary.simpleMessage("Check alerts"),
        "choosePlan": MessageLookupByLibrary.simpleMessage("Choose plan"),
        "city": MessageLookupByLibrary.simpleMessage("City"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "code": MessageLookupByLibrary.simpleMessage("Code"),
        "codeLength": MessageLookupByLibrary.simpleMessage(
            "Code must be 5 characters long"),
        "codeRequired":
            MessageLookupByLibrary.simpleMessage("Code is required"),
        "companyName": MessageLookupByLibrary.simpleMessage("Company name"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmAssignWorker": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to assign this worker?"),
        "confirmAssignWorkerMessage": MessageLookupByLibrary.simpleMessage(
            "This change will be recorded in this worker’s historial."),
        "confirmDelete": MessageLookupByLibrary.simpleMessage("Confirm delete"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
            "Confirm password is required"),
        "containerActivated": m1,
        "containerActivatedTitle":
            MessageLookupByLibrary.simpleMessage("Container Activated"),
        "containerCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Container created successfully"),
        "containerDeactivated": m2,
        "containerDeactivatedTitle":
            MessageLookupByLibrary.simpleMessage("Container Deactivated"),
        "containerDescription":
            MessageLookupByLibrary.simpleMessage("Container description"),
        "containerHealthReport": m3,
        "containerHealthReportTitle":
            MessageLookupByLibrary.simpleMessage("Container Health Report"),
        "containerLinked": m4,
        "containerLinkedTitle":
            MessageLookupByLibrary.simpleMessage("Container Linked"),
        "containerManualOff": m5,
        "containerManualOffTitle":
            MessageLookupByLibrary.simpleMessage("Container Manual Off"),
        "containerManualOn": m6,
        "containerManualOnTitle":
            MessageLookupByLibrary.simpleMessage("Container Manual On"),
        "containerName": MessageLookupByLibrary.simpleMessage("Container name"),
        "containerOff": m7,
        "containerOffTitle":
            MessageLookupByLibrary.simpleMessage("Container Off"),
        "containerOffline": m8,
        "containerOfflineTitle":
            MessageLookupByLibrary.simpleMessage("Container Offline"),
        "containerOn": m9,
        "containerOnTitle":
            MessageLookupByLibrary.simpleMessage("Container On"),
        "containerOnline": m10,
        "containerOnlineTitle":
            MessageLookupByLibrary.simpleMessage("Container Online"),
        "containerOpened": m11,
        "containerOpenedTitle":
            MessageLookupByLibrary.simpleMessage("Container Opened"),
        "containerSelectionModal": MessageLookupByLibrary.simpleMessage(
            "This change will be recorded in this container’s historial."),
        "containerStatusReport": m12,
        "containerStatusReportTitle":
            MessageLookupByLibrary.simpleMessage("Container Status Report"),
        "containerUnlinked": m13,
        "containerUnlinkedTitle":
            MessageLookupByLibrary.simpleMessage("Container Unlinked"),
        "containers": MessageLookupByLibrary.simpleMessage("Containers"),
        "containersNotFound": MessageLookupByLibrary.simpleMessage(
            "You don\'t have any Dittobox containers yet"),
        "country": MessageLookupByLibrary.simpleMessage("Country"),
        "currenTier": MessageLookupByLibrary.simpleMessage("Current Tier"),
        "currentConfigs":
            MessageLookupByLibrary.simpleMessage("Current configurations"),
        "decompositionGasesDetected": m14,
        "decompositionGasesDetectedTitle": MessageLookupByLibrary.simpleMessage(
            "Decomposition Gases Detected"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "details": MessageLookupByLibrary.simpleMessage("Details"),
        "detectAllGases":
            MessageLookupByLibrary.simpleMessage("Detect all gases"),
        "detectGases": MessageLookupByLibrary.simpleMessage("Detect gases"),
        "discard": MessageLookupByLibrary.simpleMessage("Discard"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "editContainer": MessageLookupByLibrary.simpleMessage("Edit container"),
        "editData": MessageLookupByLibrary.simpleMessage("Edit Data"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailRequired":
            MessageLookupByLibrary.simpleMessage("Email is required"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "errorApplicatingaTemplate": MessageLookupByLibrary.simpleMessage(
            "Error applicating a template"),
        "errorCreatingAccount":
            MessageLookupByLibrary.simpleMessage("Error creating account"),
        "ethylene": MessageLookupByLibrary.simpleMessage("Ethylene (C₂H₄)"),
        "ethyleneMax": MessageLookupByLibrary.simpleMessage("Max ethylene"),
        "ethyleneMin": MessageLookupByLibrary.simpleMessage("Min ethylene"),
        "expirationDate":
            MessageLookupByLibrary.simpleMessage("Expiration date"),
        "expired": MessageLookupByLibrary.simpleMessage("Expired"),
        "facilities": MessageLookupByLibrary.simpleMessage("Facilities"),
        "facility": MessageLookupByLibrary.simpleMessage("Facility"),
        "facilityCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Facility created successfully"),
        "facilityName": MessageLookupByLibrary.simpleMessage("Facility name"),
        "failedToFetchFacilities":
            MessageLookupByLibrary.simpleMessage("Failed to fetch facilities"),
        "failedToUpdatePrivileges":
            MessageLookupByLibrary.simpleMessage("Failed to update privileges"),
        "failedtoAddWorker":
            MessageLookupByLibrary.simpleMessage("Failed to add worker"),
        "fasterTechnicalSupport": MessageLookupByLibrary.simpleMessage(
            "Faster and more personalized technical support."),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot your password?"),
        "forgotPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "gasDetection": MessageLookupByLibrary.simpleMessage("Gas detection"),
        "humidity": MessageLookupByLibrary.simpleMessage("Humidity"),
        "humidityMax": MessageLookupByLibrary.simpleMessage("Max humidity"),
        "humidityMin": MessageLookupByLibrary.simpleMessage("Min humidity"),
        "humidityRegulationFailed": m15,
        "humidityRegulationFailedTitle":
            MessageLookupByLibrary.simpleMessage("Humidity Regulation Failed"),
        "humidityRegulationSuccessful": m16,
        "humidityRegulationSuccessfulTitle":
            MessageLookupByLibrary.simpleMessage(
                "Humidity Regulation Successful"),
        "humidityRegulationTriggered": m17,
        "humidityRegulationTriggeredTitle":
            MessageLookupByLibrary.simpleMessage(
                "Humidity Regulation Triggered"),
        "humidityThresholdExceeded": m18,
        "humidityThresholdExceededTitle":
            MessageLookupByLibrary.simpleMessage("Humidity Threshold Exceeded"),
        "identificationNumber":
            MessageLookupByLibrary.simpleMessage("Identification number"),
        "invalidCardHolderName":
            MessageLookupByLibrary.simpleMessage("Invalid card holder name"),
        "invalidCardNumber":
            MessageLookupByLibrary.simpleMessage("Invalid card number"),
        "invalidCvv": MessageLookupByLibrary.simpleMessage("Invalid CVV"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("Invalid email"),
        "invalidExpiryDate":
            MessageLookupByLibrary.simpleMessage("Invalid expiry date"),
        "issuedAt": m19,
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "lastKnownHealthStatus":
            MessageLookupByLibrary.simpleMessage("Last known health status"),
        "lastSync": MessageLookupByLibrary.simpleMessage("Last sync"),
        "location": MessageLookupByLibrary.simpleMessage("Location"),
        "logOut": MessageLookupByLibrary.simpleMessage("Log out"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginFailed": MessageLookupByLibrary.simpleMessage("Login failed"),
        "manageSubscription":
            MessageLookupByLibrary.simpleMessage("Manage Subscription"),
        "manager": MessageLookupByLibrary.simpleMessage("Manager"),
        "meat": MessageLookupByLibrary.simpleMessage("Meat"),
        "meats": MessageLookupByLibrary.simpleMessage("Meats"),
        "menu": MessageLookupByLibrary.simpleMessage("Menu"),
        "month": MessageLookupByLibrary.simpleMessage("Month"),
        "monthlyPlans": MessageLookupByLibrary.simpleMessage("Monthly plans"),
        "more": MessageLookupByLibrary.simpleMessage("More"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "newContainer": MessageLookupByLibrary.simpleMessage("New container"),
        "newFacility": MessageLookupByLibrary.simpleMessage("New facility"),
        "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
        "newPasswordRequired":
            MessageLookupByLibrary.simpleMessage("New password is required"),
        "newTemplate": MessageLookupByLibrary.simpleMessage("New template"),
        "nextPaymentDay":
            MessageLookupByLibrary.simpleMessage("Next payment day"),
        "noFacilitiesAvailable":
            MessageLookupByLibrary.simpleMessage("No facilities available"),
        "noFacilitiesFound": MessageLookupByLibrary.simpleMessage(
            "You don\'t have any facilities yet, please add one"),
        "noLocation": MessageLookupByLibrary.simpleMessage("No location"),
        "noPoseefacility": MessageLookupByLibrary.simpleMessage("None"),
        "noTemplateAssigned":
            MessageLookupByLibrary.simpleMessage("No template assigned"),
        "noTemplatesFound": MessageLookupByLibrary.simpleMessage(
            "Dittobox isn\'t distributing any templates yet, please look forward to it."),
        "notUsersFound": MessageLookupByLibrary.simpleMessage("No users found"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "owner": MessageLookupByLibrary.simpleMessage("Owner"),
        "oxygen": MessageLookupByLibrary.simpleMessage("Oxygen (O₂)"),
        "oxygenMax": MessageLookupByLibrary.simpleMessage("Max oxygen"),
        "oxygenMin": MessageLookupByLibrary.simpleMessage("Min oxygen"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordCannotBeEmpty":
            MessageLookupByLibrary.simpleMessage("Password cannot be empty"),
        "passwordLength": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 8 characters long"),
        "passwordMustBeAtLeast8Characters":
            MessageLookupByLibrary.simpleMessage(
                "Password must be at least 8 characters"),
        "passwordResetCode":
            MessageLookupByLibrary.simpleMessage("Password Reset Code"),
        "passwordResetCodeTitle":
            MessageLookupByLibrary.simpleMessage("Password Reset Code"),
        "passwordsDoNotMatch":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "pay": MessageLookupByLibrary.simpleMessage("Pay"),
        "paymentInformation":
            MessageLookupByLibrary.simpleMessage("Payment information"),
        "paymentSuccessful":
            MessageLookupByLibrary.simpleMessage("Payment successful"),
        "pendingAlerts": MessageLookupByLibrary.simpleMessage("Pending Alerts"),
        "pleaseEnterCategory":
            MessageLookupByLibrary.simpleMessage("Please enter a category"),
        "pleaseEnterContainerName": MessageLookupByLibrary.simpleMessage(
            "Please enter a container name"),
        "pleaseEnterDescription":
            MessageLookupByLibrary.simpleMessage("Please enter a description"),
        "pleaseEnterEthylene":
            MessageLookupByLibrary.simpleMessage("Pleasse enter an ethylene"),
        "pleaseEnterHumidity":
            MessageLookupByLibrary.simpleMessage("Please enter a humidity"),
        "pleaseEnterHumidityMax":
            MessageLookupByLibrary.simpleMessage("Please enter a Max humidity"),
        "pleaseEnterHumidityMin":
            MessageLookupByLibrary.simpleMessage("Please enter a Min humidity"),
        "pleaseEnterName":
            MessageLookupByLibrary.simpleMessage("Please enter a name"),
        "pleaseEnterOxygenMin":
            MessageLookupByLibrary.simpleMessage("Please enter a Min oxygen"),
        "pleaseEnterTemp":
            MessageLookupByLibrary.simpleMessage("Please enter a temperature"),
        "pleaseEnterTempMax": MessageLookupByLibrary.simpleMessage(
            "Please enter a Max temperature"),
        "pleaseEnterTempMin": MessageLookupByLibrary.simpleMessage(
            "Please enter a Min temperature"),
        "pleaseEnterTemplateName": MessageLookupByLibrary.simpleMessage(
            "Please enter a template name"),
        "pleaseSelectCategory":
            MessageLookupByLibrary.simpleMessage("Please select a category"),
        "premiumPlan": MessageLookupByLibrary.simpleMessage("Premium Plan"),
        "priorityTechnicalSupport":
            MessageLookupByLibrary.simpleMessage("Priority technical support"),
        "privilegesUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Privileges updated successfully"),
        "proccessedFood":
            MessageLookupByLibrary.simpleMessage("Processed food"),
        "processedFood": MessageLookupByLibrary.simpleMessage("Processed food"),
        "processedFoods":
            MessageLookupByLibrary.simpleMessage("Processed foods"),
        "produce": MessageLookupByLibrary.simpleMessage("Produce"),
        "reassign": MessageLookupByLibrary.simpleMessage("Reassign"),
        "reassignWorker":
            MessageLookupByLibrary.simpleMessage("Reassign worker"),
        "region": MessageLookupByLibrary.simpleMessage("Region"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "registerInstead":
            MessageLookupByLibrary.simpleMessage("Register instead"),
        "registrationFailed":
            MessageLookupByLibrary.simpleMessage("Registration failed"),
        "requiredField":
            MessageLookupByLibrary.simpleMessage("This is a required field"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "restaurant": MessageLookupByLibrary.simpleMessage("Restaurant"),
        "restaurants": MessageLookupByLibrary.simpleMessage("Restaurants"),
        "role": MessageLookupByLibrary.simpleMessage("Role"),
        "roleManagement":
            MessageLookupByLibrary.simpleMessage("Role management"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "selectContainers":
            MessageLookupByLibrary.simpleMessage("Select containers"),
        "selectFacility":
            MessageLookupByLibrary.simpleMessage("Select facility"),
        "selectLanguage":
            MessageLookupByLibrary.simpleMessage("Select language"),
        "selectTemplate":
            MessageLookupByLibrary.simpleMessage("Select template"),
        "setNewPassword":
            MessageLookupByLibrary.simpleMessage("Set New Password"),
        "setNewPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Set New Password"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "simultaneousMonitoring": MessageLookupByLibrary.simpleMessage(
            "Simultaneous monitoring of up to 5 DittoBoxes for multiple restaurants."),
        "spanish": MessageLookupByLibrary.simpleMessage("Spanish"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "statusContainer": MessageLookupByLibrary.simpleMessage("Status"),
        "subscribe": MessageLookupByLibrary.simpleMessage("Subscribe"),
        "subscription": MessageLookupByLibrary.simpleMessage("Subscription"),
        "subscriptionDetails":
            MessageLookupByLibrary.simpleMessage("Subscription details"),
        "subscriptionPlans":
            MessageLookupByLibrary.simpleMessage("Subscription Plans"),
        "subscriptionTier":
            MessageLookupByLibrary.simpleMessage("Subscription Tier"),
        "success": MessageLookupByLibrary.simpleMessage("Success"),
        "sulfurDioxide":
            MessageLookupByLibrary.simpleMessage("Sulfur dioxide (SO₂)"),
        "sulfurDioxideMax":
            MessageLookupByLibrary.simpleMessage("Max sulfur dioxide"),
        "sulfurDioxideMin":
            MessageLookupByLibrary.simpleMessage("Min sulfur dioxide"),
        "supportForLargerChains": MessageLookupByLibrary.simpleMessage(
            "Support for larger chains (up to 10 restaurants)."),
        "tempMax": MessageLookupByLibrary.simpleMessage("Max temperature"),
        "tempMin": MessageLookupByLibrary.simpleMessage("Min temperature"),
        "temperature": MessageLookupByLibrary.simpleMessage("Temperature"),
        "temperatureRegulationFailed": m20,
        "temperatureRegulationFailedTitle":
            MessageLookupByLibrary.simpleMessage(
                "Temperature Regulation Failed"),
        "temperatureRegulationSuccessful": m21,
        "temperatureRegulationSuccessfulTitle":
            MessageLookupByLibrary.simpleMessage(
                "Temperature Regulation Successful"),
        "temperatureRegulationTriggered": m22,
        "temperatureRegulationTriggeredTitle":
            MessageLookupByLibrary.simpleMessage(
                "Temperature Regulation Triggered"),
        "temperatureThresholdExceeded": m23,
        "temperatureThresholdExceededTitle":
            MessageLookupByLibrary.simpleMessage(
                "Temperature Threshold Exceeded"),
        "template": MessageLookupByLibrary.simpleMessage("Template"),
        "templateAssigned": m24,
        "templateAssignedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Template assigned successfully"),
        "templateAssignedSuccessfullyToContainer": m25,
        "templateAssignedTitle":
            MessageLookupByLibrary.simpleMessage("Template Assigned"),
        "templateConfiguration":
            MessageLookupByLibrary.simpleMessage("Template Configuration"),
        "templateLibrary":
            MessageLookupByLibrary.simpleMessage("Template Library"),
        "templateName": MessageLookupByLibrary.simpleMessage("Template name"),
        "templates": MessageLookupByLibrary.simpleMessage("Templates"),
        "title": MessageLookupByLibrary.simpleMessage("DittoBox"),
        "type": MessageLookupByLibrary.simpleMessage("Type"),
        "unknownAlert": m26,
        "unknownAlertTitle":
            MessageLookupByLibrary.simpleMessage("Unknown Alert"),
        "upTo": MessageLookupByLibrary.simpleMessage("Up to"),
        "updatePaymentInformation":
            MessageLookupByLibrary.simpleMessage("Update"),
        "upgradePlan": MessageLookupByLibrary.simpleMessage("Upgrade plan"),
        "userInformation":
            MessageLookupByLibrary.simpleMessage("User Information"),
        "userInformationDetails":
            MessageLookupByLibrary.simpleMessage("User Information Details"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "usernameCannotBeEmpty":
            MessageLookupByLibrary.simpleMessage("Username cannot be empty"),
        "ventilationRegulationFailed": m27,
        "ventilationRegulationFailedTitle":
            MessageLookupByLibrary.simpleMessage(
                "Ventilation Regulation Failed"),
        "ventilationRegulationSuccessful": m28,
        "ventilationRegulationSuccessfulTitle":
            MessageLookupByLibrary.simpleMessage(
                "Ventilation Regulation Successful"),
        "ventilationRegulationTriggered": m29,
        "ventilationRegulationTriggeredTitle":
            MessageLookupByLibrary.simpleMessage(
                "Ventilation Regulation Triggered"),
        "verifyCode": MessageLookupByLibrary.simpleMessage("Verify Code"),
        "viewContainers":
            MessageLookupByLibrary.simpleMessage("View containers"),
        "viewCurrentConfigs":
            MessageLookupByLibrary.simpleMessage("View current configs"),
        "viewWorkers": MessageLookupByLibrary.simpleMessage("View workers"),
        "warehouse": MessageLookupByLibrary.simpleMessage("Warehouse"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome"),
        "worker": MessageLookupByLibrary.simpleMessage("Worker"),
        "workerAssignConfirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "workerAssignedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Worker assigned successfully"),
        "workerDetails": MessageLookupByLibrary.simpleMessage("Worker details"),
        "workerList": MessageLookupByLibrary.simpleMessage("Worker List"),
        "workerReassigned": MessageLookupByLibrary.simpleMessage(
            "Worker reassigned successfully"),
        "workerUnassignedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Worker unassigned successfully"),
        "workers": MessageLookupByLibrary.simpleMessage("Workers"),
        "yearly": MessageLookupByLibrary.simpleMessage("Yearly"),
        "yearlyPlans": MessageLookupByLibrary.simpleMessage("Yearly plans")
      };
}
