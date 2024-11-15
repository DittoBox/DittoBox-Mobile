// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dittobox_mobile/account_and_subscription/infrastructure/model/account_model.dart';
import 'package:dittobox_mobile/user_and_profile/infrastructure/models/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:dittobox_mobile/shared/services/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountService extends BaseService {
  // Method to create a new account
  // baseUrl/account
  // Parameter "representativeId" is retrieved from shared_preferences
  // {
  // "businessName": "string",
  // "businessId": "string",
  // "representativeId": 0
  // }
  Future<int> createAccount(
      String businessName, String businessId) async {
    final prefs = SharedPreferencesAsync();
    final representativeId = await prefs.getInt('userId') ?? 0;
    final token = await prefs.getString('token') ?? '';

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
    var jsonResponse = jsonDecode(response.body);
  
    if (response.statusCode == 200) {
      await prefs.setInt('accountId', jsonResponse['id']);
      return 200;
    }

    return response.statusCode;
  }

  // Method to get account details
  // baseUrl/account/{accountId}
  // Parameter "accountId" is retrieved from shared_preferences
  Future<Account?> getAccountDetails() async {
    try {
      final prefs = SharedPreferencesAsync();
      final accountId = await prefs.getInt('accountId');
      if (accountId == null) {
        throw Exception('Account ID is null');
      }
      // ignore: duplicate_ignore
      // ignore: avoid_print
      print('Account ID: $accountId');
      final url = '$baseUrl/account/$accountId';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        }
      );
      if (response.statusCode == 200) {
        final responseBody = response.body;
        print('Response body: $responseBody');
        return Account.fromJson(jsonDecode(responseBody));
      } else {
        throw Exception('Failed to load account details');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<List<Profile>> getUsersByAccountId() async {
    try {
      final prefs = SharedPreferencesAsync();
      final accountId = await prefs.getInt('accountId');
      if (accountId == null) {
        throw Exception('Account ID is null');
      }
      final url = '$baseUrl/account/$accountId/users';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        }
      );
      if (response.statusCode == 200) {
        final responseBody = response.body;
        final List<dynamic> users = jsonDecode(responseBody);
        return users.map((user) => Profile.fromJson(user)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
   Future<Map<String, dynamic>?> getGroupLocation(int groupId) async {
    final prefs = SharedPreferencesAsync();
    final accountId = await prefs.getInt('accountId');
    final url = '$baseUrl/account/$accountId/groups';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> groups = jsonDecode(response.body);
      final group = groups.firstWhere((group) => group['id'] == groupId, orElse: () => null);
      return group != null ? group['location'] : null;
    } else {
      throw Exception('Failed to load group location');
    }
  }

  Future<List<Map<String, dynamic>>> getGroups() async {
    final prefs = SharedPreferencesAsync();
    final accountId = await prefs.getInt('accountId');
    final url = '$baseUrl/account/$accountId/groups';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> groups = jsonDecode(response.body);
      return groups.map((group) => group as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load groups');
    }
  }
}