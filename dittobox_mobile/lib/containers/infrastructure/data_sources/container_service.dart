import 'package:dittobox_mobile/containers/infrastructure/models/container.dart';
import 'package:dittobox_mobile/shared/infrastructure/data-sources/services/base_service.dart';
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

  Future<void> createContainer(String deviceId ,String name, String description, int groupId) async {
    try {
        final prefs = SharedPreferencesAsync();
        final accountId = await prefs.getInt('accountId');
       if (accountId == null) {
        throw Exception('Account ID not found');
      }
      // Create the container
      final createContainerBody = jsonEncode({
        'deviceId': deviceId,
        'name': name,
        'description': description,
        'accountId': accountId,
        'groupId': groupId,
      });
      print('Create container request body: $createContainerBody');

      final response = await http.post(
        Uri.parse('$baseUrl/container'),
        headers: {'Content-Type': 'application/json'},
        body: createContainerBody,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

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

  Future<List<Container>> getContainersByFacilityId(int facilityId) async {
    final response = await http.get(Uri.parse('$baseUrl/group/$facilityId/containers'));
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => Container.fromJson(json)).toList();
  }

    Future<void> updateContainerParameters(int containerId, Map<String, dynamic> parameters) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/api/v1/container/$containerId/parameters'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(parameters),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update container parameters');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to update container parameters: $e');
    }
  }
    Future<void> assignTemplateToContainer(int containerId, int templateId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/container/$containerId/assign/$templateId'),
        headers: {'Content-Type': 'text/plain'},
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to assign template to container');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to assign template to container: $e');
    }
  }
}