import '../../domain/entites/kickbox_entity.dart';

class KickboxAdapter extends KickboxEntity {
  KickboxAdapter({
    required bool enabled,
  }) : super(
          enabled: enabled,
        );
  factory KickboxAdapter.fromMap(Map<String, dynamic> map) {
    return KickboxAdapter(
      enabled: map['enabled'] ?? false,
    );
  }
}
