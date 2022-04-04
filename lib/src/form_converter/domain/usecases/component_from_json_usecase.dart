import 'package:dartz/dartz.dart';

import '../../../core/errors/form_from_json_error.dart';
import '../entites/form_entity.dart';
import '../errors/domain_errors.dart';
import '../infra_interfaces/component_from_json_repository_interface.dart';
import 'interfaces/component_from_json_usecase_interface.dart';

class FormFromJsonUsecase implements FormFromJsonUsecaseInterface {
  FormFromJsonRepositoryInterface repository;
  FormFromJsonUsecase({
    required this.repository,
  });

  @override
  Either<FormFromJsonError, FormEntity> call(Map<String, dynamic> fields) {
    if (fields.isEmpty) {
      return Left(
        JsonIsEmptyDomainFormFromJsonError(
          message: 'The parameter does not contain data',
          stackTrace: StackTrace.current,
        ),
      );
    }

    final result = repository(fields);

    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
