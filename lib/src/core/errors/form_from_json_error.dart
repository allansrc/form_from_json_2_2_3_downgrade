// ignore_for_file: public_member_api_docs

abstract class FormFromJsonError implements Exception {
  String message;
  StackTrace stackTrace;
  Object? error;
  FormFromJsonError({
    required this.message,
    required this.stackTrace,
    this.error,
  });
}
