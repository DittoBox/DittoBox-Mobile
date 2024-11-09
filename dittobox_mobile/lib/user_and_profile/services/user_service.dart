import 'dart:convert';
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
  Future registerUser(String firstName, String lastName, String username, String email, String password) async {
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
  Future<http.Response> loginUser(String email, String password) async {
    final url = '$baseUrl/login';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    return response;
  }

  // Method to create a new account
  // baseUrl/account
  // Parameter "representativeId" is retrieved from shared_preferences
  // {
  // "businessName": "string",
  // "businessId": "string",
  // "representativeId": 0
  // }
  Future<Map<String, dynamic>> createAccount(String businessName, String businessId) async {
    final prefs = await SharedPreferences.getInstance();
    final representativeId = prefs.getInt('representativeId') ?? 0;
    final token = prefs.getString('token') ?? '';

    final url = '$baseUrl/account';
    final response = await http.post(
      Uri.parse(url),
      headers: getHeaders(token),
      body: jsonEncode({
        'businessName': businessName,
        'businessId': businessId,
        'representativeId': representativeId,
      }),
    );
    return jsonDecode(response.body);
  }
}