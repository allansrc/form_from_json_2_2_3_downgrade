import '../../domain/entites/header_entity.dart';

class HeaderAdapter extends HeaderEntity {
  HeaderAdapter({
    required Map<String, dynamic> data,
  }) : super(
          data: data,
        );

  factory HeaderAdapter.fromMap(Map<String, dynamic> map) {
    return HeaderAdapter(
      data: Map<String, dynamic>.from(
        map,
      ),
    );
  }
}
