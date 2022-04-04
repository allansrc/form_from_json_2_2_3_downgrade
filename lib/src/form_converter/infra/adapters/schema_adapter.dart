import '../../domain/entites/components_entity.dart';
import '../../domain/entites/schema_entity.dart';
import 'component_adapter.dart';

class SchemaAdapter extends SchemaEntity {
  SchemaAdapter({
    required String title,
    required String display,
    required String type,
    required String name,
    required String path,
    required List<ComponentEntity> components,
    required Map settings,
  }) : super(
          title: title,
          display: display,
          type: type,
          name: name,
          path: path,
          components: components,
          settings: settings,
        );

  factory SchemaAdapter.fromMap(Map<String, dynamic> map) {
    return SchemaAdapter(
      title: map['title'] ?? '',
      display: map['display'] ?? '',
      type: map['type'] ?? '',
      name: map['name'] ?? '',
      path: map['path'] ?? '',
      components: List<ComponentEntity>.from((map['components'] as List?)?.map(
              (e) => ComponentsAdapter.fromMap(e as Map<String, dynamic>)) ??
          {}),
      settings: map['settings'] ?? {},
    );
  }
}
