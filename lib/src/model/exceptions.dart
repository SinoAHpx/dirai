class VerifyFailedException implements Exception{
  String message;
  VerifyFailedException(this.message);
}

class InvalidResponseException implements Exception {
  String message;
  InvalidResponseException(this.message);
}