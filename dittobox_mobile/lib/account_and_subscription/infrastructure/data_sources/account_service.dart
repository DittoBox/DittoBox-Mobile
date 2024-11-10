import 'dart:convert';
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
    final prefs = await SharedPreferences.getInstance();
    final representativeId = prefs.getInt('userId') ?? 0;
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
    var jsonResponse = jsonDecode(response.body);
  
    if (response.statusCode == 200) {
      await prefs.setInt('accountId', jsonResponse['id']);
      return 200;
    }

    return response.statusCode;
  }
}