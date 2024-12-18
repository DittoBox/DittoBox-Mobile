import 'dart:convert';
import 'dart:developer';
import 'package:dittobox_mobile/shared/infrastructure/data-sources/services/base_service.dart';
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
  Future<int> registerUser(String firstName, String lastName, String username,
      String email, String password) async {
    final url = '$baseUrl/user';
    print('Registering user with URL: $url');
    print('Request body: ${jsonEncode({
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'password': password,
    })}');
    
    final response = await http.post(
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

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    
    return response.statusCode;
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

    // Verificar que los datos de la respuesta sean válidos
    if (data['userId'] != null && data['token'] != null) {
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
      print('WorkerManagement: ${privileges.contains('WorkerManagement')}');
      await prefs.setBool(
        'hasGroupManagementPrivilege',
        privileges.contains('GroupManagement'),
      );
      print('GroupManagement: ${privileges.contains('GroupManagement')}');
      await prefs.setBool(
        'hasAccountManagementPrivilege',
        privileges.contains('AccountManagement'),
      );
      print('AccountManagement: ${privileges.contains('AccountManagement')}');
      return 200;
    } else {
      // Datos inválidos en la respuesta
      return 401; // Código de error para credenciales incorrectas
    }
  }
  return response.statusCode;
}

  // Method to get user details
  // baseUrl/user/{userId}
  // Parameter "userId" is retrieved from shared_preferences

  Future<Map<String, dynamic>?> getUserDetails() async {
    try {
      final prefs = SharedPreferencesAsync();
      final userId= await prefs.getInt('userId');
      print('User ID: $userId');
      if (userId == null) {
        throw Exception('User ID not found');
      }
      final url = '$baseUrl/user/$userId';
      final response = await http.get(
        Uri.parse(url)
      );
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return jsonResponse;
      }
      return null;
    } catch (e) {
      log('Error: $e');
      return null;
    }
  }

  // Method to logout a user
  // baseUrl/user/logout
  // Request body:
  // {
  // "userId": "string"
  // }
  Future logoutUser() async {
    final prefs = SharedPreferencesAsync();
    final userId = prefs.getInt('userId');
    final url = '$baseUrl/user/logout';
    await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'userId': userId,
      }),
    );
    await prefs.clear();
  }
    Future<int> changePassword(String newPassword) async {
    final prefs = SharedPreferencesAsync();
    final userId = await prefs.getInt('userId') ?? 0;

    final url = '$baseUrl/user/change-password';
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'userId': userId,
        'newPassword': newPassword,
      }),
    );
    print('Response status: ${response.statusCode}');

    return response.statusCode;
  }


}
