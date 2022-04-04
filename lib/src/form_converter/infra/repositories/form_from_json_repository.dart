import 'package:dartz/dartz.dart';

import '../../../core/errors/form_from_json_error.dart';
import '../../domain/entites/form_entity.dart';
import '../../domain/infra_interfaces/component_from_json_repository_interface.dart';
import '../adapters/form_adapter.dart';
import '../errors/infra_erros.dart';

class FormFromJsonRepository implements FormFromJsonRepositoryInterface {
  @override
  Either<FormFromJsonError, FormEntity> call(Map<String, dynamic> fields) {
    if (fields.containsKey('form')) {
      final form = fields['form'];
      final result = FormAdapter.fromMap(form);

      return Right(result);
    } else {
      return Left(
        JsonDecoderInfraFormFromJsonError(
          message: 'Json Form dont contains key [form]',
          stackTrace: StackTrace.current,
        ),
      );
    }
  }
}
