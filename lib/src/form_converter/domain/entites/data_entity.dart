// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'values_entity.dart';

class DataEntity {
  List<ValuesEntity> values;
  String resource;
  String json;
  String url;
  String custom;
  Map<String, String>? headers;

  DataEntity({
    required this.values,
    required this.resource,
    required this.json,
    required this.url,
    required this.custom,
    this.headers,
  });

  DataEntity copyWith({
    List<ValuesEntity>? values,
    String? resource,
    String? json,
    String? url,
    String? custom,
    Map<String, String>? headers,
  }) {
    return DataEntity(
      values: values ?? this.values,
      resource: resource ?? this.resource,
      json: json ?? this.json,
      url: url ?? this.url,
      custom: custom ?? this.custom,
      headers: headers ?? this.headers,
    );
  }
}
