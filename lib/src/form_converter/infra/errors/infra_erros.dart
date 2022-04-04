import '../../../core/errors/form_from_json_error.dart';

abstract class InfraFormFromJsonError extends FormFromJsonError {
  InfraFormFromJsonError({
    required String message,
    required StackTrace stackTrace,
    Object? error,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          error: error,
        );
}

class JsonDecoderInfraFormFromJsonError extends InfraFormFromJsonError {
  JsonDecoderInfraFormFromJsonError({
    required String message,
    required StackTrace stackTrace,
    Object? error,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          error: error,
        );
}

class MapperInfraFormFromJsonError extends InfraFormFromJsonError {
  MapperInfraFormFromJsonError({
    required String message,
    required StackTrace stackTrace,
    Object? error,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          error: error,
        );
}
