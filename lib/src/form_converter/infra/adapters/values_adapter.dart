import '../../domain/entites/values_entity.dart';

class ValuesAdapter extends ValuesEntity {
  ValuesAdapter({
    required String label,
    required String value,
    required Map<String, dynamic> shortcut,
  }) : super(
          label: label,
          value: value,
          shortcut: shortcut,
        );

  factory ValuesAdapter.fromMap(Map<String, dynamic> map) {
    return ValuesAdapter(
      label: map['label'] ?? '',
      value: map['value'] ?? '',
      shortcut: map['shortcut'] ?? {},
    );
  }
}
