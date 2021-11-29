import 'dart:developer';

const String BASE_PATH = 'www.plantshome.somee.com';

abstract class WebClient {
  String basePath = BASE_PATH;

  String get basePathGet {
    return basePath;
  }

  set basePathSet(String _basePath) {
    basePath = _basePath;
  }

  Future<WebResponse> post(String path, String object,
      {Map<String, String>? params, Map<String, String>? headers});

  Future<WebResponse> get(String path,
      {Map<String, String>? params, Map<String, String>? headers});

  Future<WebResponse> put(String path, String object,
      {Map<String, String>? params, Map<String, String>? headers});

  Future<WebResponse> delete(String path,
      {Map<String, String>? params, Map<String, String>? headers});

  Uri buildUri(String path, Map<String, dynamic>? params) {
    Uri uri = Uri.https(basePath, path, params);
    log('request: $uri');
    return uri;
  }
}

class WebResponse {
  final int? statusCode;
  final String body;
  final Map<String, String>? headers;

  WebResponse({required this.statusCode, required this.body, this.headers});

  @override
  String toString() {
    return '{statusCode: $statusCode, body: $body}';
  }
}
