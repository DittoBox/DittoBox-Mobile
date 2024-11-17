import 'package:dittobox_mobile/shared/services/base_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dittobox_mobile/generated/l10n.dart';

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

Future<void> fetchAndShowNotification(BuildContext context, String endpoint) async {
  final response = await http.get(Uri.parse(endpoint));

  if (response.statusCode == 200) {
    List<dynamic> notifications = json.decode(response.body);
    for (var notification in notifications) {
      String title = S.of(context).alert(notification['alertType']);
      String body;
      if (notification.containsKey('containerId')) {
        String containerName = await getContainerName(notification['containerId']);
        body = getAlertDescription(context, notification['alertType'], containerName);
      } else if (notification.containsKey('groupId')) {
        String groupName = await getGroupName(notification['groupId']);
        body = getAlertDescription(context, notification['alertType'], groupName);
      } else {
        body = S.of(context).issuedAt(notification['issuedAt']);
      }
      await showNotification(title, body);
    }
  } else {
    throw Exception('Error al cargar las notificaciones');
  }
}

Future<void> fetchAccountNotifications(BuildContext context) async {
  final prefs = SharedPreferencesAsync();
  final accountId = prefs.getInt('accountId');
  String endpoint = '${baseService.baseUrl}/notification/account/$accountId';
  await fetchAndShowNotification(context, endpoint);
}

Future<void> fetchGroupNotifications(BuildContext context, int groupId) async {
  String endpoint = '${baseService.baseUrl}/notification/group/$groupId';
  await fetchAndShowNotification(context, endpoint);
}

Future<void> fetchContainerNotifications(BuildContext context, int containerId) async {
  String endpoint = '${baseService.baseUrl}/notification/container/$containerId';
  await fetchAndShowNotification(context, endpoint);
}