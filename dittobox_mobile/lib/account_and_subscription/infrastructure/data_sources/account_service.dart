import 'dart:convert';
import 'package:dittobox_mobile/account_and_subscription/infrastructure/model/account_model.dart';
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
      final prefs = await SharedPreferencesAsync();
      final accountId = await prefs.getInt('accountId');
      if (accountId == null) {
        throw Exception('Account ID is null');
      }
      if (baseUrl == null) {
        throw Exception('Base URL is null');
      }
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
        if (responseBody == null) {
          throw Exception('Response body is null');
        }
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
}