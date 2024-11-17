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
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

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
    Future<void> grantPrivileges(int profileId, int privilegeId) async {
      final url = '$baseUrl/profile/grant-privileges';
      print('Granting privileges: profileId=$profileId, privilegeId=$privilegeId');
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'profileId': profileId,
          'privilegeId': privilegeId,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode != 200 && response.statusCode != 204) {
        print('Failed to grant privileges: ${response.body}');
        throw Exception('Failed to grant privileges');
      }
    }

    Future<void> revokePrivileges(int profileId, int privilegeId) async {
      final url = '$baseUrl/profile/revoke-privileges';
      print('Revoking privileges: profileId=$profileId, privilegeId=$privilegeId');
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'profileId': profileId,
          'privilegeId': privilegeId,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode != 200 && response.statusCode != 204) {
        print('Failed to revoke privileges: ${response.body}');
        throw Exception('Failed to revoke privileges');
      }
    }

    Future<Profile?> getProfileDetailsById(int userId) async {
    try {
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