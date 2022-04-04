import '../../domain/entites/month_entity.dart';

class MonthAdapter extends MonthEntity {
  MonthAdapter({
    required String type,
    required String placeholder,
    required bool hide,
    required bool required,
  }) : super(
          type: type,
          placeholder: placeholder,
          hide: hide,
          required: required,
        );

  factory MonthAdapter.fromMap(Map<String, dynamic> map) {
    return MonthAdapter(
      type: map['type'] ?? '',
      placeholder: map['placeholder'] ?? '',
      hide: map['hide'] ?? false,
      required: map['required'] ?? false,
    );
  }
}
