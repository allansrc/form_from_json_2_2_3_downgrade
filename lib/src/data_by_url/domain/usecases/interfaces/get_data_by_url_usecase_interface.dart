import 'package:dartz/dartz.dart';

import '../../../../core/dtos/access_params_dto.dart';
import '../../../../core/errors/form_from_json_error.dart';
import '../../entities/data_by_url_entity.dart';

// ignore: one_member_abstracts
abstract class GetDataByUrlUsecaseInterface {
  Future<Either<FormFromJsonError, DataByUrlEntity>> call(AccessParamsDto args, String argsParam);
}
