import 'dart:async';

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
  if (response.statusCode == 200) {
    final container = json.decode(response.body);
    return container['name'];
  } else {
    throw Exception('Error al obtener el nombre del contenedor');
  }
}

Future<String> getGroupName(int groupId) async {
  final response = await http.get(Uri.parse('${baseService.baseUrl}/group/$groupId'));
  if (response.statusCode == 200) {
    final group = json.decode(response.body);
    return group['name'];
  } else {
    throw Exception('Error al obtener el nombre del grupo');
  }
}

String getAlertDescription(BuildContext context, String alertType, String name) {
  switch (alertType) {
    case 'TemperatureThresholdExceeded':
      return S.of(context).temperatureThresholdExceeded(name);
    case 'HumidityThresholdExceeded':
      return S.of(context).humidityThresholdExceeded(name);
    case 'DecompositionGasesDetected':
      return S.of(context).decompositionGasesDetected(name);
    case 'ContainerLinked':
      return S.of(context).containerLinked(name);
    case 'ContainerUnlinked':
      return S.of(context).containerUnlinked(name);
    case 'ContainerOff':
      return S.of(context).containerOff(name);
    case 'ContainerOn':
      return S.of(context).containerOn(name);
    case 'TemplateAssigned':
      return S.of(context).templateAssigned(name);
    case 'ContainerActivated':
      return S.of(context).containerActivated(name);
    case 'ContainerDeactivated':
      return S.of(context).containerDeactivated(name);
    case 'TemperatureRegulationTriggered':
      return S.of(context).temperatureRegulationTriggered(name);
    case 'TemperatureRegulationSuccessful':
      return S.of(context).temperatureRegulationSuccessful(name);
    case 'TemperatureRegulationFailed':
      return S.of(context).temperatureRegulationFailed(name);
    case 'HumidityRegulationTriggered':
      return S.of(context).humidityRegulationTriggered(name);
    case 'HumidityRegulationSuccessful':
      return S.of(context).humidityRegulationSuccessful(name);
    case 'HumidityRegulationFailed':
      return S.of(context).humidityRegulationFailed(name);
    case 'VentilationRegulationTriggered':
      return S.of(context).ventilationRegulationTriggered(name);
    case 'VentilationRegulationSuccessful':
      return S.of(context).ventilationRegulationSuccessful(name);
    case 'VentilationRegulationFailed':
      return S.of(context).ventilationRegulationFailed(name);
    case 'ContainerHealthReport':
      return S.of(context).containerHealthReport(name);
    case 'ContainerStatusReport':
      return S.of(context).containerStatusReport(name);
    case 'ContainerManualOn':
      return S.of(context).containerManualOn(name);
    case 'ContainerManualOff':
      return S.of(context).containerManualOff(name);
    case 'ContainerOpened':
      return S.of(context).containerOpened(name);
    case 'ContainerOnline':
      return S.of(context).containerOnline(name);
    case 'ContainerOffline':
      return S.of(context).containerOffline(name);
    default:
      return S.of(context).unknownAlert(name);
  }
}
void startNotificationService(BuildContext context) {
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    final prefs = await SharedPreferencesAsync();
    final accountId = prefs.getInt('accountId');
      // ignore: use_build_context_synchronously
      await fetchAndShowNotification(context, '${baseService.baseUrl}/notification/account/1');
    
  });
}

Future<void> fetchAndShowNotification(BuildContext context, String endpoint) async {
  print('Fetching notifications from endpoint: $endpoint');
  final response = await http.get(Uri.parse(endpoint));
  print('Response status code: ${response.statusCode}');

  if (response.statusCode == 200) {
    List<dynamic> notifications = json.decode(response.body);
    print('Notifications fetched: $notifications');
    for (var notification in notifications) {
      String alertType = notification['alertType'].toString();
      String title = S.of(context).alert(alertType);
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
  final accountId = prefs.getInt('accountId');
  print('Account ID: $accountId');
  
  if (accountId == null) {
    print('Error: Account ID is null');
    throw Exception('Account ID is null');
  }

  String endpoint = '${baseService.baseUrl}/notification/account/1';
  final response = await http.get(Uri.parse(endpoint));
  print('Response status code: ${response.statusCode}');

  if (response.statusCode == 200) {
    List<dynamic> notifications = json.decode(response.body);
    print('Notifications fetched: $notifications');
    return notifications.map((notification) {
      return {
        "time": notification['issuedAt'],
        "title": S.of(context).alert(notification['alertType'].toString()),
        "description": notification['description'],
        "viewAction": "View Details",
        "dismissAction": "Dismiss",
      };
    }).toList();
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