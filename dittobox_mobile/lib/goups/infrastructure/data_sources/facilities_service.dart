import 'dart:convert';

import 'package:dittobox_mobile/goups/infrastructure/models/facilities.dart';
import 'package:dittobox_mobile/goups/infrastructure/models/location.dart';
import 'package:dittobox_mobile/shared/services/base_service.dart';
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
          print(data); // Agrega esta línea para depurar
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
}

