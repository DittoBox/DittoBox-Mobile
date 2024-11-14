import 'dart:convert';
import 'package:dittobox_mobile/user_and_profile/infrastructure/models/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dittobox_mobile/shared/services/base_service.dart';

class ProfileService extends BaseService {
  Future<Profile?> getProfileDetails() async {
    try {
      final prefs = SharedPreferencesAsync();
      final userId = await prefs.getInt('userId');
      print('User ID: $userId');
      final url = '$baseUrl/profile/$userId';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return Profile.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load profile details');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}