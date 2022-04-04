import '../../domain/entites/year_entity.dart';

class YearAdapter extends YearEntity {
  YearAdapter({
    required String type,
    required String minYear,
    required String maxYear,
    required String placeholder,
    required bool hide,
    required bool required,
  }) : super(
          type: type,
          minYear: minYear,
          maxYear: maxYear,
          placeholder: placeholder,
          hide: hide,
          required: required,
        );
  factory YearAdapter.fromMap(Map<String, dynamic> map) {
    return YearAdapter(
      type: map['type'] ?? '',
      minYear: map['minYear'] ?? '',
      maxYear: map['maxYear'] ?? '',
      placeholder: map['placeholder'] ?? '',
      hide: map['hide'] ?? false,
      required: map['required'] ?? false,
    );
  }
}
