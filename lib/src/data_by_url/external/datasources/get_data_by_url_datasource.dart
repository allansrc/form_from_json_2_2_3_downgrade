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
  Future<DataByUrlEntity> call(AccessParamsDto args, String argValue) async {
    var optArgs = '';
    if (args.url.contains('ocorrencia.id') && argValue.isNotEmpty) {
      optArgs = args.url.toString().split('ocorrencia.id').first + argValue;
    }
    final response = await service.get(
      optArgs.isEmpty ? args.url : optArgs,
      headers: args.headers,
      responseType: ResponseType.json,
    );
    if (response.data is List) {
      return DataByUrlAdapter.fromMap(<String, dynamic>{'values': response.data});
    } else {
      return DataByUrlAdapter.fromMap(response.data);
    }
  }
}
