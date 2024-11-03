
class BaseService {
  final String baseUrl = 'https://dittobox.free.beeceptor.com/api/v1';

  // Method to add the token to the headers
  Map<String, String> getHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}