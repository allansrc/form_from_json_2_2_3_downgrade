import '../../domain/entites/id_entity.dart';

class IdAdapter extends IdEntity {
  IdAdapter({
    required String id,
    required bool neW,
  }) : super(
          id: id,
          neW: neW,
        );
  factory IdAdapter.fromMap(Map<String, dynamic> map) {
    return IdAdapter(
      id: map['id'] ?? '',
      neW: map['neW'] ?? false,
    );
  }
}
