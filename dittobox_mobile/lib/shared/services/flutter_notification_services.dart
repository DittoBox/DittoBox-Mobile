import 'dart:async';

import 'package:dittobox_mobile/shared/infrastructure/models/alert_type.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/shared/services/base_service.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
BaseService baseService = BaseService();

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> showNotification(String title, String body) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    channelDescription: 'your channel description',
    importance: Importance.max,
    priority: Priority.high,
  );
  const NotificationDetails notificationDetails = NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    notificationDetails,
  );
}

Future<void> cancelNotification() async {
  await flutterLocalNotificationsPlugin.cancel(0);
}
Future selectNotification(String payload) async {
  if (payload != null) {
    debugPrint('notification payload: $payload');
  }
}


String getPeruTime() {
  final now = DateTime.now().toUtc().subtract(Duration(hours: 5));
  final formatter = DateFormat('dd-MM-yyyy HH:mm');
  return formatter.format(now);
}

Future<String> getContainerName(int containerId) async {
  final response = await http.get(Uri.parse('${baseService.baseUrl}/container/$containerId'));
  print('Response status code: ${response.statusCode}');
  if (response.statusCode == 200) {
    final container = json.decode(response.body);
    print('Container data: $container');
    return container['name'] ?? 'Unknown Container';
  } else {
    print('Error fetching container name: ${response.statusCode}');
    throw Exception('Error al obtener el nombre del contenedor');
  }
}

Future<String> getGroupName(int groupId) async {
  final response = await http.get(Uri.parse('${baseService.baseUrl}/group/$groupId'));
  print('Response status code: ${response.statusCode}');
  if (response.statusCode == 200) {
    final group = json.decode(response.body);
    print('Group data: $group');
    return group['name'] ?? 'Unknown Group';
  } else {
    print('Error fetching group name: ${response.statusCode}');
    throw Exception('Error al obtener el nombre del grupo');
  }
}


String getAlertDescription(BuildContext context, int alertType, String name) {
  switch (alertType) {
    case 1:
      return S.of(context).temperatureThresholdExceeded(name);
    case 2:
      return S.of(context).humidityThresholdExceeded(name);
    case 3:
      return S.of(context).decompositionGasesDetected(name);
    case 4:
      return S.of(context).containerLinked(name);
    case 5:
      return S.of(context).containerUnlinked(name);
    case 6:
      return S.of(context).containerOff(name);
    case 7:
      return S.of(context).containerOn(name);
    case 8:
      return S.of(context).templateAssigned(name);
    case 9:
      return S.of(context).containerActivated(name);
    case 10:
      return S.of(context).containerDeactivated(name);
    case 11:
      return S.of(context).temperatureRegulationTriggered(name);
    case 12:
      return S.of(context).temperatureRegulationSuccessful(name);
    case 13:
      return S.of(context).temperatureRegulationFailed(name);
    case 14:
      return S.of(context).humidityRegulationTriggered(name);
    case 15:
      return S.of(context).humidityRegulationSuccessful(name);
    case 16:
      return S.of(context).humidityRegulationFailed(name);
    case 17:
      return S.of(context).ventilationRegulationTriggered(name);
    case 18:
      return S.of(context).ventilationRegulationSuccessful(name);
    case 19:
      return S.of(context).ventilationRegulationFailed(name);
    case 20:
      return S.of(context).containerHealthReport(name);
    case 21:
      return S.of(context).containerStatusReport(name);
    case 22:
      return S.of(context).containerManualOn(name);
    case 23:
      return S.of(context).containerManualOff(name);
    case 24:
      return S.of(context).containerOpened(name);
    case 25:
      return S.of(context).containerOnline(name);
    case 26:
      return S.of(context).containerOffline(name);
    default:
      return S.of(context).unknownAlert(name);
  }
}

String getAlertTitle(BuildContext context, int alertType) {
  switch (alertType) {
    case 1:
      return S.of(context).temperatureThresholdExceededTitle;
    case 2:
      return S.of(context).humidityThresholdExceededTitle;
    case 3:
      return S.of(context).decompositionGasesDetectedTitle;
    case 4:
      return S.of(context).containerLinkedTitle;
    case 5:
      return S.of(context).containerUnlinkedTitle;
    case 6:
      return S.of(context).containerOffTitle;
    case 7:
      return S.of(context).containerOnTitle;
    case 8:
      return S.of(context).templateAssignedTitle;
    case 9:
      return S.of(context).containerActivatedTitle;
    case 10:
      return S.of(context).containerDeactivatedTitle;
    case 11:
      return S.of(context).temperatureRegulationTriggeredTitle;
    case 12:
      return S.of(context).temperatureRegulationSuccessfulTitle;
    case 13:
      return S.of(context).temperatureRegulationFailedTitle;
    case 14:
      return S.of(context).humidityRegulationTriggeredTitle;
    case 15:
      return S.of(context).humidityRegulationSuccessfulTitle;
    case 16:
      return S.of(context).humidityRegulationFailedTitle;
    case 17:
      return S.of(context).ventilationRegulationTriggeredTitle;
    case 18:
      return S.of(context).ventilationRegulationSuccessfulTitle;
    case 19:
      return S.of(context).ventilationRegulationFailedTitle;
    case 20:
      return S.of(context).containerHealthReportTitle;
    case 21:
      return S.of(context).containerStatusReportTitle;
    case 22:
      return S.of(context).containerManualOnTitle;
    case 23:
      return S.of(context).containerManualOffTitle;
    case 24:
      return S.of(context).containerOpenedTitle;
    case 25:
      return S.of(context).containerOnlineTitle;
    case 26:
      return S.of(context).containerOfflineTitle;
    default:
      return S.of(context).unknownAlertTitle;
  }
}

Future<void> fetchAndShowNotification(BuildContext context, String endpoint) async {
  print('Fetching notifications from endpoint: $endpoint');
  final response = await http.get(Uri.parse(endpoint));
  print('Response status code: ${response.statusCode}');

  if (response.statusCode == 200) {
    List<dynamic> notifications = json.decode(response.body);
    print('Notifications fetched: $notifications');
    for (var notification in notifications) {
      int alertType = notification['alertType'];
      String title = S.of(context).alert(alertType.toString());
      print('Notification title: $title');
      String body;
      if (notification.containsKey('containerId')) {
        String containerName = await getContainerName(notification['containerId']);
        print('Container name: $containerName');
        body = getAlertDescription(context, alertType, containerName);
      } else if (notification.containsKey('groupId')) {
        String groupName = await getGroupName(notification['groupId']);
        print('Group name: $groupName');
        body = getAlertDescription(context, alertType, groupName);
      } else {
        // Convertir la hora recibida del API al formato deseado
        String issuedAt = notification['issuedAt'];
        DateTime issuedAtDateTime = DateTime.parse(issuedAt).toUtc().subtract(Duration(hours: 5));
        String formattedIssuedAt = DateFormat('dd-MM-yyyy HH:mm').format(issuedAtDateTime);
        body = S.of(context).issuedAt(formattedIssuedAt);
      }
      print('Notification body: $body');
      await showNotification(title, body);
    }
  } else {
    print('Error fetching notifications: ${response.statusCode}');
    throw Exception('Error al cargar las notificaciones');
  }
}

Future<List<Map<String, dynamic>>> fetchAccountNotifications(BuildContext context) async {
  print('Fetching account notifications');
  final prefs = SharedPreferencesAsync();
  final accountId = await prefs.getInt('accountId');
  print('Account ID: $accountId');
  
  if (accountId == null) {
    print('Error: Account ID is null');
    throw Exception('Account ID is null');
  }

  String endpoint = '${baseService.baseUrl}/notification/account/$accountId';
  final response = await http.get(Uri.parse(endpoint));
  print('Response status code: ${response.statusCode}');

  if (response.statusCode == 200) {
    List<dynamic> notifications = json.decode(response.body);
    print('Notifications fetched: $notifications');
    List<Map<String, dynamic>> mappedNotifications = await Future.wait(notifications.map((notification) async {
      int alertType = notification['alertType'];
      String description;
      if (notification.containsKey('containerId')) {
        String containerName = await getContainerName(notification['containerId']);
        description = getAlertDescription(context, alertType, containerName);
      } else if (notification.containsKey('groupId')) {
        String groupName = await getGroupName(notification['groupId']);
        description = getAlertDescription(context, alertType, groupName);
      } else {
        description = notification['description'] ?? '';
      }
      return {
        "time": notification['issuedAt'],
        "title": getAlertTitle(context, alertType),
        "description": description,
        "viewAction": "View Details",
        "dismissAction": "Dismiss",
      };
    }).toList());
    print('Notifications mapped: $mappedNotifications');
    return mappedNotifications;
  } else {
    print('Error fetching account notifications: ${response.statusCode}');
    throw Exception('Error al cargar las notificaciones');
  }
}


Future<void> fetchGroupNotifications(BuildContext context, int groupId) async {
  print('Fetching group notifications for group ID: $groupId');
  String endpoint = '${baseService.baseUrl}/notification/group/$groupId';
  await fetchAndShowNotification(context, endpoint);
}

Future<void> fetchContainerNotifications(BuildContext context, int containerId) async {
  print('Fetching container notifications for container ID: $containerId');
  String endpoint = '${baseService.baseUrl}/notification/container/$containerId';
  await fetchAndShowNotification(context, endpoint);
}