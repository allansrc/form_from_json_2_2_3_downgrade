import '../../domain/entites/conditional_entity.dart';

// ignore: avoid_classes_with_only_static_members
class ConditionalAdapter extends ConditionalEntity {
  ConditionalAdapter({
    required bool show,
    required String when,
    required String eq,
    required String json,
  }) : super(
          show: show,
          when: when,
          eq: eq,
          json: json,
        );

  factory ConditionalAdapter.fromMap(Map<String, dynamic> map) {
    return ConditionalAdapter(
      show: map['show'] == null || map['show'] == '' ? false : map['show'],
      when: map['when'] ?? '',
      eq: map['eq'] ?? '',
      json: map['json'] ?? '',
    );
  }
}
