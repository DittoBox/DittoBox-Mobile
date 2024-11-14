import 'dart:convert';
import 'package:dittobox_mobile/account_and_subscription/infrastructure/model/subscription_model.dart';
import 'package:http/http.dart' as http;
import 'package:dittobox_mobile/shared/services/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionService extends BaseService {
  
  Future<Subscription?> getSubscriptionDetails() async {
    try {
      final prefs = await SharedPreferencesAsync();
      final accountId = await prefs.getInt('accountId');
      print('Account ID: $accountId');
      final url = '$baseUrl/subscription/$accountId';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return Subscription.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load subscription details');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}