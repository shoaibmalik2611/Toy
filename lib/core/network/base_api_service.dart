abstract class BaseApiService {
  Future<dynamic> getResponse(String url, bool isHeaderRequired, [token]);

  Future<dynamic> postResponse(String url, Map<String, String> jsonBody);
}
