class ValidateEntity {
  bool? required;
  int? minLength;
  int? maxLength;
  int? minWords;
  int? maxWords;
  String? pattern;
  String? customMessage;
  String? custom;
  bool? customPrivate;
  String? json;
  bool? strictDateValidation;
  bool? multiple;
  bool? unique;
  String? min;
  int? max;
  String? step;
  String? integer;
  bool? onlyAvailableItems;
  String? minSelectedCount;
  String? maxSelectedCount;

  ValidateEntity({
    required this.required,
    required this.minLength,
    required this.maxLength,
    required this.minWords,
    required this.maxWords,
    required this.pattern,
    required this.customMessage,
    required this.custom,
    required this.customPrivate,
    required this.json,
    required this.strictDateValidation,
    required this.multiple,
    required this.unique,
    required this.min,
    required this.max,
    required this.step,
    required this.integer,
    required this.onlyAvailableItems,
    required this.minSelectedCount,
    required this.maxSelectedCount,
  });
}
