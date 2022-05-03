import '../../../core/dtos/access_params_dto.dart';
import '../../domain/entities/data_by_url_entity.dart';

// ignore: one_member_abstracts
abstract class GetDataByUrlDatasourceInterface {
  Future<DataByUrlEntity> call(AccessParamsDto args, String argsParam);
}
