class BaseService {
  final String baseUrl = 'https://dittobox-cloud-bubuexbzeyb5fqh6.westus2-01.azurewebsites.net/api/v1';

  // Method to add the token to the headers
  Map<String, String> getHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}