import 'dart:convert';

import 'package:dittobox_mobile/goups/infrastructure/models/facilities.dart';
import 'package:dittobox_mobile/shared/services/base_service.dart';
import 'package:http/http.dart' as http;

class FacilitiesService extends BaseService {
  static final FacilitiesService _singleton = FacilitiesService._internal();

  factory FacilitiesService() {
    return _singleton;
  }

  FacilitiesService._internal();

  Future<List<Facility>> getFacilities() async {
    try{
      final response = await http.get(Uri.parse('$baseUrl/facilities'));
      if(response.statusCode == 200){
        final List<dynamic> data = json.decode(response.body);
        return data.map((e) => Facility.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load facilities');
      }
    } catch (e) {
      throw Exception('Failed to load facilities');
    }
  }
  
}

