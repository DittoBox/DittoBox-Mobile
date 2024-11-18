import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/main.dart';

class FirebaseApi {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final fCMtoken = await _firebaseMessaging.getToken();

    print('FCM Token: $fCMtoken');

    if (fCMtoken != null) {
      await subscribeToTopic(fCMtoken, 'actualizacion');
    }

    initPushNotifications();
  }

  Future<void> subscribeToTopic(String token, String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
    print('Token suscrito al tema: $topic');
  }

  void HandleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState?.pushNamed(AppRoutes.notifications, arguments: message);
  }

  Future<void> initPushNotifications() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      HandleMessage(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      HandleMessage(message);
    });
  }
}