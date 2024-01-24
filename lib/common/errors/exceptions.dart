class ServerException implements Exception {
  final String cause;
  ServerException(this.cause);
}

class ParsingException implements Exception {
  final String cause;
  ParsingException(this.cause);
}

class CacheException implements Exception {
  final String cause;
  CacheException(this.cause);
}
