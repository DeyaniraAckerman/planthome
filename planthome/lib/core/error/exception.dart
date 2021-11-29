
///Exception usadas en toda la aplicacion.
class ServerException implements Exception {
  final String message;
  final int statusCode;

  ServerException({this.message = '', this.statusCode = 0});

  @override
  String toString() {
    return '$message';
  }
}

class CacheException implements Exception {
  final String message;
  CacheException([this.message = '']);

  @override
  String toString() {
    return '$message}';
  }
}
