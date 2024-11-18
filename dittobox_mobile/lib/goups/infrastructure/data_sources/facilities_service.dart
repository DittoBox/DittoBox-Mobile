import 'dart:convert';

import 'package:dittobox_mobile/goups/infrastructure/models/facilities.dart';
import 'package:dittobox_mobile/goups/infrastructure/models/location.dart';
import 'package:dittobox_mobile/shared/infrastructure/data-sources/services/base_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FacilitiesService extends BaseService {
  static final FacilitiesService _singleton = FacilitiesService._internal();

  factory FacilitiesService() {
    return _singleton;
  }

  FacilitiesService._internal();

    Future<List<Facility>> getFacilities() async {
      try {
        final prefs = SharedPreferencesAsync();
        final accountId = await prefs.getInt('accountId');
        final response = await http.get(Uri.parse('$baseUrl/account/$accountId/groups'));
        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);
          return data.map((e) => Facility.fromJson(e)).toList();
        } else {
          throw Exception('Failed to load facilities');
        }
      } catch (e) {
        throw Exception('Failed to load facilities: $e');
      }
    }

  Future<int> createFacility(
      String name, Location location, int facilityType) async {
    try {
      final prefs = SharedPreferencesAsync();
      final int? accountId = await prefs.getInt('accountId');
      if (accountId == null) {
        throw Exception('Account ID not found');
      }

      final response = await http.post(
        Uri.parse('$baseUrl/group/create-group'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'location': location.toJson(),
          'accountId': accountId,
          'facilityType': facilityType,
        }),
      );

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        return data['id'];
      } else {
        throw Exception('Failed to create facility');
      }
    } catch (e) {
      throw Exception('Failed to create facility: $e');
    }
  }

  Future<void> registerUserInGroup(int groupId, String email) async {
    final prefs = SharedPreferencesAsync();
    final accountId = await prefs.getInt('accountId');
    if (accountId == null) {
      throw Exception('Account ID not found');
    }
    final url = '$baseUrl/group/$groupId/register-user';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'accountId': accountId,
        'groupId': groupId,
      }),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      print('Failed to register user: ${response.body}'); // Agrega esta línea para depurar
      throw Exception('Failed to register user: ${response.body}');
    } else {
      print('User registered successfully: ${response.body}'); // Agrega esta línea para confirmar éxito
    }
  }

    Future<int> countNotificationsByGroupId(int groupid) async {
      try {
        final url = '$baseUrl/notification/group/$groupid/amount';
        print('Requesting URL: $url'); // Depuración
        final response = await http.get(Uri.parse(url));

        print('Response status: ${response.statusCode}'); // Depuración
        print('Response body: ${response.body}'); // Depuración

        if (response.statusCode == 200) {
          final int notificationCount = int.parse(response.body);
          print('Group ID: $groupid');
          print('Notification count: $notificationCount'); // Depuración
          return notificationCount;
        } else {
          throw Exception('Failed to load notifications: ${response.body}');
        }
      } catch (e) {
        print('Error occurred: $e');
        throw Exception('Failed to load notifications');
      }
    }
}