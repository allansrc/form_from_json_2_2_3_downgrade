import '../../domain/entities/data_by_url_entity.dart';

class DataByUrlAdapter extends DataByUrlEntity {
  DataByUrlAdapter({
    Map<String, dynamic>? data,
  }) : super(
          data: data,
        );

  factory DataByUrlAdapter.fromMap(Map<String, dynamic> map) {
    return DataByUrlAdapter(
      data: Map<String, dynamic>.from(map),
    );
  }
}
