import 'package:dartz/dartz.dart';

import '../../../core/dtos/access_params_dto.dart';
import '../../../core/errors/form_from_json_error.dart';
import '../../../core/services/errors/service_error.dart';
import '../../domain/entities/data_by_url_entity.dart';
import '../../domain/infra_interfaces/repository/get_data_by_url_repository_interface.dart';
import '../external_interfaces/get_data_by_url_datasource_interface.dart';

class GetDataByUrlRepository implements GetDataByUrlRepositoryInterface {
  GetDataByUrlDatasourceInterface datasource;
  GetDataByUrlRepository(this.datasource);

  @override
  Future<Either<FormFromJsonError, DataByUrlEntity>> call(
      AccessParamsDto args, String argsParam) async {
    try {
      final result = await datasource(args, argsParam);
      return Right(result);
    } on ServiceError catch (e) {
      return Left(e);
    }
  }
}
