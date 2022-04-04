import '../../domain/entites/form_entity.dart';

abstract class FormFromJsonState {}

class InitFormFromJsonState extends FormFromJsonState {}

class LoadingFormFromJsonState extends FormFromJsonState {}

class SuccessFormFromJsonState extends FormFromJsonState {
  FormEntity form;
  SuccessFormFromJsonState({
    required this.form,
  });
}

class ErrorFormFromJsonState extends FormFromJsonState {
  String message;
  ErrorFormFromJsonState({
    required this.message,
  });
}
