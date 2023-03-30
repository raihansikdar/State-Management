class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([
    this.message,
    this.prefix,
    this.url,
  ]); //make parameter optional so that, user deosn't have to provide name while calling it
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad Request', url);
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process', url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message, String? url])
      : super(message, 'Api not responded', url);
}

class UnAuthorizeException extends AppException {
  UnAuthorizeException([String? message, String? url])
      : super(message, 'UnAuthorized request', url);
}
