import 'package:the_scene/app/network/error_message_model.dart';

class ServerExceptions implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerExceptions({
    required this.errorMessageModel,
  });
}

class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException({
    required this.message,
  });
}
