import '../../domain/entites/day_entity.dart';

class DayAdapter extends DayEntity {
  DayAdapter({
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

  factory DayAdapter.fromMap(Map<String, dynamic> map) {
    return DayAdapter(
      type: map['type'] ?? '',
      placeholder: map['placeholder'] ?? '',
      hide: map['hide'] ?? false,
      required: map['required'] ?? false,
    );
  }
}
