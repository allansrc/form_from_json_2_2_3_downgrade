import '../../domain/entites/overlay_entity.dart';

// ignore: avoid_classes_with_only_static_members
class OverlayAdapter extends OverlayEntity {
  OverlayAdapter({
    required String style,
    required String page,
    required String left,
    required String top,
    required String width,
    required String height,
  }) : super(
          style: style,
          page: page,
          left: left,
          top: top,
          width: width,
          height: height,
        );

  factory OverlayAdapter.fromMap(Map<String, dynamic> map) {
    return OverlayAdapter(
      style: map['style'] ?? '',
      page: map['page'] ?? '',
      left: map['left'] ?? '',
      top: map['top'] ?? '',
      width: map['width'] ?? '',
      height: map['height'] ?? '',
    );
  }
}
