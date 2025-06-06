class BaseService {
  final String baseUrl = 'https://webservices.mydittobox.net/';

  // Method to add the token to the headers
  Map<String, String> getHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}