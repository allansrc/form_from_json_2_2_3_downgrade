import 'components_entity.dart';

class ColumnsEntity {
  List<ComponentEntity> components;
  int width;
  int offset;
  int push;
  int pull;
  String size;
  int currentWidth;

  ColumnsEntity({
    required this.components,
    required this.width,
    required this.offset,
    required this.push,
    required this.pull,
    required this.size,
    required this.currentWidth,
  });
}
