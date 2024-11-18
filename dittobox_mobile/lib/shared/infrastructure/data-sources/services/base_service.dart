class BaseService {
  final String baseUrl = 'https://app-prod-01-dittobox-argeesg8era0c7ex.eastus-01.azurewebsites.net/api/v1';

  // Method to add the token to the headers
  Map<String, String> getHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}