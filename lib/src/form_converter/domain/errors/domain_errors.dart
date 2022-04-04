import '../../../core/errors/form_from_json_error.dart';

abstract class DomainFormFromJsonError extends FormFromJsonError {
  DomainFormFromJsonError({
    required String message,
    required StackTrace stackTrace,
    Object? error,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          error: error,
        );
}

class JsonIsEmptyDomainFormFromJsonError extends DomainFormFromJsonError {
  JsonIsEmptyDomainFormFromJsonError({
    required String message,
    required StackTrace stackTrace,
    Object? error,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          error: error,
        );
}
