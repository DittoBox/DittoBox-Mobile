import 'dart:convert';
import 'dart:developer';
import 'package:dittobox_mobile/shared/services/base_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends BaseService {
  // Method to register a new user profile
  // baseUrl/user
  // Request body:
  // {
  // "firstName": "string",
  // "lastName": "string",
  // "username": "string",
  // "email": "string",
  // "password": "string"
  // }
  Future registerUser(String firstName, String lastName, String username,
      String email, String password) async {
    final url = '$baseUrl/user';
    await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
        'password': password,
      }),
    );
  }

  // Method to login a user
  // baseUrl/login
  // {
  // "email": "string",
  // "password": "string"
  // }
  Future<int> loginUser(String email, String password) async {
    final url = '$baseUrl/user/login';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final prefs = SharedPreferencesAsync();
      await prefs.setInt('userId', data['userId']);
      await prefs.setString('username', data['username']);
      await prefs.setString('token', data['token']);
      await prefs.setInt('profileId', data['profileId']);

      // Save nullable integers, handling null values
      await prefs.setInt('accountId', data['accountId'] ?? -1);
      await prefs.setInt('groupId', data['groupId'] ?? -1);

      // Convert privileges to List<String>
      List<String> privileges = List<String>.from(data['privileges']);

      // Save privileges as boolean values
      await prefs.setBool(
        'hasWorkerManagementPrivilege',
        privileges.contains('WorkerManagement'),
      );
      await prefs.setBool(
        'hasGroupManagementPrivilege',
        privileges.contains('GroupManagement'),
      );
      await prefs.setBool(
        'hasAccountManagementPrivilege',
        privileges.contains('AccountManagement'),
      );

      // Validate if shared preferences are saved
      final userId = await prefs.getInt('userId');
      final username = await prefs.getString('username');
      final token = await prefs.getString('token');
      final profileId = await prefs.getInt('profileId');
      final accountId = await prefs.getInt('accountId');
      final groupId = await prefs.getInt('groupId');
      final hasWorkerManagementPrivilege = await
          prefs.getBool('hasWorkerManagementPrivilege');
      final hasGroupManagementPrivilege = await
          prefs.getBool('hasGroupManagementPrivilege');
      final hasAccountManagementPrivilege = await
          prefs.getBool('hasAccountManagementPrivilege');

      // Check if any value is null and throw exception
      if (userId == null ||
          username == null ||
          token == null ||
          profileId == null ||
          accountId == null ||
          groupId == null ||
          hasWorkerManagementPrivilege == null ||
          hasGroupManagementPrivilege == null ||
          hasAccountManagementPrivilege == null) {
        throw Exception('Preferences not saved properly');
      }

      log('userId: $userId');
      log('username: $username');
      log('token: $token');
      log('profileId: $profileId');
      log('accountId: $accountId');
      log('groupId: $groupId');
      log('hasWorkerManagementPrivilege: $hasWorkerManagementPrivilege');
      log('hasGroupManagementPrivilege: $hasGroupManagementPrivilege');
      log('hasAccountManagementPrivilege: $hasAccountManagementPrivilege');

      return 200;
    }
    return response.statusCode;
  }
}
