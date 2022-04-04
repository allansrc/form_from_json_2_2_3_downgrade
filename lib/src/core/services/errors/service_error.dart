import '../../errors/form_from_json_error.dart';

class ServiceError extends FormFromJsonError {
  ServiceError({
    required String message,
    required StackTrace stackTrace,
    Object? error,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          error: error,
        );
}
