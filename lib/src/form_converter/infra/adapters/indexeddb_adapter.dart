import '../../domain/entites/indexeddb_entity.dart';
import '../../domain/entites/properties_entity.dart';
import 'properties_adapter.dart';

// ignore: avoid_classes_with_only_static_members
class IndexeddbAdapter extends IndexeddbEntity {
  IndexeddbAdapter({
    required PropertiesEntity filter,
  }) : super(
          filter: filter,
        );

  factory IndexeddbAdapter.fromMap(Map<String, dynamic> map) {
    return IndexeddbAdapter(
      filter: PropertiesAdapter.fromMap(map['filter'] ?? {}),
    );
  }
}
