import 'schema_entity.dart';

class FormEntity {
  String? id;
  int? version;
  String? name;
  String? description;
  SchemaEntity? schema;
  dynamic type;
  List<dynamic>? externalIds;
  dynamic tenantId;
  dynamic owner;
  bool? active;
  dynamic created;
  dynamic modified;
  bool? neW;

  FormEntity({
    required this.id,
    required this.version,
    required this.name,
    required this.description,
    required this.schema,
    required this.type,
    required this.externalIds,
    required this.tenantId,
    required this.owner,
    required this.active,
    required this.created,
    required this.modified,
    required this.neW,
  });
}
