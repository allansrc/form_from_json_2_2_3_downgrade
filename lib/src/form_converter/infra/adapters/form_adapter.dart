import '../../domain/entites/form_entity.dart';
import '../../domain/entites/id_entity.dart';
import '../../domain/entites/schema_entity.dart';
import 'id_adapter.dart';
import 'schema_adapter.dart';

class FormAdapter extends FormEntity {
  FormAdapter({
    required String id,
    required int version,
    required String name,
    required String description,
    required SchemaEntity schema,
    required type,
    required List externalIds,
    required tenantId,
    required owner,
    required bool active,
    required created,
    required modified,
    required bool neW,
  }) : super(
          id: id,
          version: version,
          name: name,
          description: description,
          schema: schema,
          type: type,
          externalIds: externalIds,
          tenantId: tenantId,
          owner: owner,
          active: active,
          created: created,
          modified: modified,
          neW: neW,
        );

  factory FormAdapter.fromMap(Map<String, dynamic> map) {
    return FormAdapter(
      id: map['id'].runtimeType != String ? (map['id']['id'] ?? '') : (map['id'] ?? ''),
      version: map['version']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      schema: SchemaAdapter.fromMap(map['schema'] ?? {}),
      type: map['type'],
      externalIds: List<dynamic>.from(map['externalIds'] ?? []),
      tenantId: map['tenantId'],
      owner: map['owner'],
      active: map['active'] ?? false,
      created: map['created'],
      modified: map['modified'],
      neW: map['neW'] ?? false,
    );
  }
}
