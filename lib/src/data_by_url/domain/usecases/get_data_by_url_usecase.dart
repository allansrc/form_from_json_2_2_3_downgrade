import 'package:dartz/dartz.dart';

import '../../../core/dtos/access_params_dto.dart';
import '../../../core/errors/form_from_json_error.dart';
import '../entities/data_by_url_entity.dart';
import '../infra_interfaces/repository/get_data_by_url_repository_interface.dart';
import 'interfaces/get_data_by_url_usecase_interface.dart';

class GetDataByUrlUsecase implements GetDataByUrlUsecaseInterface {
  GetDataByUrlRepositoryInterface repository;
  GetDataByUrlUsecase(this.repository);

  @override
  Future<Either<FormFromJsonError, DataByUrlEntity>> call(
      AccessParamsDto args) async {
    final result = await repository(args);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
