import 'package:uno/uno.dart';

import '../../../core/dtos/access_params_dto.dart';
import '../../../core/services/client_service_interface.dart';
import '../../domain/entities/data_by_url_entity.dart';
import '../../infra/external_interfaces/get_data_by_url_datasource_interface.dart';
import '../adapters/data_by_url_adapter.dart';

class GetDataByUrlDatasource implements GetDataByUrlDatasourceInterface {
  ClientServiceInterface service;
  GetDataByUrlDatasource(this.service);

  @override
  Future<DataByUrlEntity> call(AccessParamsDto args) async {
    final response = await service.get(
      args.url,
      headers: args.headers,
      responseType: ResponseType.json,
    );
    return DataByUrlAdapter.fromMap(response.data);
  }
}
