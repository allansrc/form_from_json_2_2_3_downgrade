import '../../domain/entites/fuse_options_entity.dart';

// ignore: avoid_classes_with_only_static_members
class FuseOptionsAdapter extends FuseOptionsEntity {
  FuseOptionsAdapter({
    required String include,
    required double threshold,
  }) : super(
          include: include,
          threshold: threshold,
        );

  factory FuseOptionsAdapter.fromMap(Map<String, dynamic> map) {
    return FuseOptionsAdapter(
      include: map['include'] ?? '',
      threshold: map['threshold']?.toDouble() ?? 0.0,
    );
  }
}
