import '../../domain/entites/fields_entity.dart';
import 'day_adapter.dart';
import 'month_adapter.dart';
import 'year_adapter.dart';

// ignore: avoid_classes_with_only_static_members
abstract class FieldsAdapter {
  static FieldsEntity fromMap(Map<String, dynamic> map) {
    return FieldsEntity(
      day: DayAdapter.fromMap(map['day'] ?? {}),
      month: MonthAdapter.fromMap(map['month'] ?? {}),
      year: YearAdapter.fromMap(map['year'] ?? {}),
    );
  }
}
