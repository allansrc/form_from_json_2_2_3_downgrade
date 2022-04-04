import '../../domain/entites/data_entity.dart';
import '../../domain/entites/values_entity.dart';
import 'values_adapter.dart';

// ignore: avoid_classes_with_only_static_members
class DataAdapter extends DataEntity {
  DataAdapter({
    required List<ValuesEntity> values,
    required String resource,
    required String json,
    required String url,
    required String custom,
    Map<String, String>? headers,
  }) : super(
          values: values,
          resource: resource,
          json: json,
          url: url,
          custom: custom,
          headers: headers,
        );

  factory DataAdapter.fromMap(Map<String, dynamic> map) {
    var headerMap = <String, String>{};
    if (map['headers'] != null) {
      if (map['headers'] is List && map['headers'].isNotEmpty) {
        var headers = map['headers'] as List;

        for (var header in headers) {
          headerMap.addAll(
            {header['key'].toString(): header['value'].toString()},
          );
        }
      }
    }

    return DataAdapter(
      values: List<ValuesEntity>.from(map['values']
              ?.map((e) => ValuesAdapter.fromMap(e as Map<String, dynamic>)) ??
          []),
      resource: map['resource'] ?? '',
      json: map['json'] ?? '',
      url: map['url'] ?? '',
      custom: map['custom'] ?? '',
      headers: headerMap,
    );
  }
}
