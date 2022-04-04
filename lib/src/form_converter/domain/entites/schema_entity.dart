import 'components_entity.dart';

class SchemaEntity {
  String title;
  String display;
  String type;
  String name;
  String path;
  List<ComponentEntity> components;
  Map settings;

  SchemaEntity({
    required this.title,
    required this.display,
    required this.type,
    required this.name,
    required this.path,
    required this.components,
    required this.settings,
  });
}
