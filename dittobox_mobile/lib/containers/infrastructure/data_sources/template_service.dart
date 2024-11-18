import 'package:dittobox_mobile/containers/infrastructure/models/template.dart';
import 'package:dittobox_mobile/shared/infrastructure/data-sources/services/base_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TemplateService extends BaseService {

    Future<List<Template>> getTemplates() async {
    final response = await http.get(Uri.parse('$baseUrl/template'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Template> templates = body.map((dynamic item) => Template.fromJson(item)).toList();
      return templates;
    } else {
      throw Exception('Failed to load templates');
    }
  }

  Future<Template> getTemplate(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/template/$id'));

    if (response.statusCode == 200) {
      return Template.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load template');
    }
  }

  Future<Template> createTemplate(Map<String, dynamic> templateData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/template'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(templateData),
    );

    if (response.statusCode == 201) {
      return Template.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create template');
    }
  }



}