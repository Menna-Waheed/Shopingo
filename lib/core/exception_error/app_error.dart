abstract class AppException implements Exception {
  String errorMessage;
  int? statesCode;

  AppException({required this.errorMessage, this.statesCode});
}

class ServerEXception extends AppException {
  ServerEXception({required super.errorMessage, super.statesCode});
}

class NetworkEXception extends AppException {
  NetworkEXception({required super.errorMessage, super.statesCode});
}

class UnExpectedError extends AppException {
  UnExpectedError({required super.errorMessage, super.statesCode});
}
