import '../../domain/entites/validate_entity.dart';

class ValidateAdapter extends ValidateEntity {
  ValidateAdapter({
    required bool? required,
    required int? minLength,
    required int? maxLength,
    required int? minWords,
    required int? maxWords,
    required String? pattern,
    required String? customMessage,
    required String? custom,
    required bool? customPrivate,
    required String? json,
    required bool? strictDateValidation,
    required bool? multiple,
    required bool? unique,
    required String? min,
    required int? max,
    required String? step,
    required String? integer,
    required bool? onlyAvailableItems,
    required String? minSelectedCount,
    required String? maxSelectedCount,
  }) : super(
          required: required,
          minLength: minLength,
          maxLength: maxLength,
          minWords: minWords,
          maxWords: maxWords,
          pattern: pattern,
          customMessage: customMessage,
          custom: custom,
          customPrivate: customPrivate,
          json: json,
          strictDateValidation: strictDateValidation,
          multiple: multiple,
          unique: unique,
          min: min,
          max: max,
          step: step,
          integer: integer,
          onlyAvailableItems: onlyAvailableItems,
          minSelectedCount: minSelectedCount,
          maxSelectedCount: maxSelectedCount,
        );

  factory ValidateAdapter.fromMap(Map<String, dynamic> map) {
    return ValidateAdapter(
      required: map['required'] ?? false,
      minLength: map['minLength'] == null || map['minLength'] == ''
          ? 0
          : map['minLength'],
      maxLength: map['maxLength'] == '' ? null : map['maxLength'],
      minWords: map['minWords'],
      maxWords: map['maxWords'],
      pattern: map['pattern'],
      customMessage: map['customMessage'],
      custom: map['custom'],
      customPrivate: map['customPrivate'] ?? false,
      json: map['json'],
      strictDateValidation: map['strictDateValidation'] ?? false,
      multiple: map['multiple'] ?? false,
      unique: map['unique'] ?? false,
      min: map['min'],
      max: map['max'] == '' ? null : map['max'],
      step: map['step'],
      integer: map['integer'],
      onlyAvailableItems: map['onlyAvailableItems'] ?? false,
      minSelectedCount: map['minSelectedCount'],
      maxSelectedCount: map['maxSelectedCount'],
    );
  }
}
