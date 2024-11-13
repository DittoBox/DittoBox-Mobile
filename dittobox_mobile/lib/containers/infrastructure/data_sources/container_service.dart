import 'package:dittobox_mobile/containers/infrastructure/models/container.dart';
import 'package:dittobox_mobile/shared/services/base_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ContainerService extends BaseService {
  Future<List<Container>> getContainersByAccountId() async {
	final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    final String accountId = await asyncPrefs.getString('accountId') ?? '';
    final response = await http.get(Uri.parse('/account/$accountId/containers'));
    final List<dynamic> data = json.decode(response.body);
    return data.map((container) => Container.fromJson(container)).toList();
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