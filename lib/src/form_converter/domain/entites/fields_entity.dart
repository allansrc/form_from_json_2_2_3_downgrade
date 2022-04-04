import 'day_entity.dart';
import 'month_entity.dart';
import 'year_entity.dart';

class FieldsEntity {
  DayEntity day;
  MonthEntity month;
  YearEntity year;

  FieldsEntity({
    required this.day,
    required this.month,
    required this.year,
  });
}
