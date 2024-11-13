import 'package:dittobox_mobile/containers/infrastructure/models/container.dart';
import 'package:dittobox_mobile/shared/services/base_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ContainerService extends BaseService {

  
  Future<List<Container>> getContainersByAccountId() async {
    try {
      final prefs = SharedPreferencesAsync();
      final accountId = await prefs.getInt('accountId');
      if (accountId == null) {
        throw Exception('Account ID not found');
      }
      
      final response = await http.get(Uri.parse('$baseUrl/account/$accountId/containers'));
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((container) => Container.fromJson(container)).toList();
      } else {
        throw Exception('Failed to load containers');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load containers: $e');
    }
  }

  Future<void> createContainer(String name, String description, int groupId, int containerSizeId) async {
    try {
      final prefs = SharedPreferencesAsync();
      final accountId = await prefs.getInt('accountId');
      if (accountId == null) {
        throw Exception('Account ID not found');
      }

      final response = await http.post(
        Uri.parse('$baseUrl/container'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'description': description,
          'accountId': accountId,
          'groupId': groupId,
          'containerSizeId': containerSizeId,
        }),
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to create container');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to create container: $e');
    }
  }



  Future<Container> getContainerById(String containerId) async {
    final response = await http.get(Uri.parse('/containers/$containerId'));
    final Map<String, dynamic> data = json.decode(response.body);
    return Container.fromJson(data);
  }

  Future<Container> getContainerByFacilityId(int? facilityId) async {
    if (facilityId == null) {
      final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
      facilityId = await asyncPrefs.getInt('groupId'); 
    }
    final response = await http.get(Uri.parse('/group/$facilityId/containers'));
    final Map<String, dynamic> data = json.decode(response.body);
    return Container.fromJson(data);
  }
}