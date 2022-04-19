class VerifyFailedException implements Exception{
  String message;
  VerifyFailedException(this.message);
}

class InvalidResponseException implements Exception {
  String message;
  InvalidResponseException(this.message);
}

class UnknownMessageTypeException implements Exception {
  String message;
  UnknownMessageTypeException(this.message);
}