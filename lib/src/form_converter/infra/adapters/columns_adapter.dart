import '../../domain/entites/columns_entity.dart';
import '../../domain/entites/components_entity.dart';
import 'component_adapter.dart';

class ColumnsAdapter extends ColumnsEntity {
  ColumnsAdapter({
    required List<ComponentEntity> components,
    required int width,
    required int offset,
    required int push,
    required int pull,
    required String size,
    required int currentWidth,
  }) : super(
          components: components,
          width: width,
          offset: offset,
          push: push,
          pull: pull,
          size: size,
          currentWidth: currentWidth,
        );

  factory ColumnsAdapter.fromMap(Map<String, dynamic> map) {
    return ColumnsAdapter(
      components: List<ComponentEntity>.from(map['components']
          ?.map((e) => ComponentsAdapter.fromMap(e as Map<String, dynamic>))),
      width: map['width']?.toInt() ?? 0,
      offset: map['offset']?.toInt() ?? 0,
      push: map['push']?.toInt() ?? 0,
      pull: map['pull']?.toInt() ?? 0,
      size: map['size'] ?? '',
      currentWidth: map['currentWidth']?.toInt() ?? 0,
    );
  }
}
