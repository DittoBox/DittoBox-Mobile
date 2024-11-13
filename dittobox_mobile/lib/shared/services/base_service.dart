class BaseService {
  final String baseUrl = 'https://app-dev-01-dittobox-a8bpd5bkh4dnh3g7.eastus-01.azurewebsites.net/api/v1';

  // Method to add the token to the headers
  Map<String, String> getHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}