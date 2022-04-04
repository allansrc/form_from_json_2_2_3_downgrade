import 'package:flutter_triple/flutter_triple.dart';
import '../../../core/errors/form_from_json_error.dart';
import '../../domain/usecases/interfaces/component_from_json_usecase_interface.dart';
import '../states/form_from_json_state.dart';

class FormWidgetStore
    extends StreamStore<FormFromJsonError, FormFromJsonState> {
  final FormFromJsonUsecaseInterface usecase;
  FormWidgetStore({
    required this.usecase,
  }) : super(InitFormFromJsonState());

  Future<void> getForm(Map<String, dynamic> fields) async {
    final result = usecase(fields);

    result.fold(
      setError,
      (r) => update(SuccessFormFromJsonState(form: r)),
    );
  }
}
