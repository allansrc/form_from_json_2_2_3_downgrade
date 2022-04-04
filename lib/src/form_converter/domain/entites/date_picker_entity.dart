class DatePickerEntity {
  String minDate;
  String disable;
  String disableFunction;
  bool disableWeekends;
  bool disableWeekdays;
  bool showWeeks;
  int startingDay;
  String initDate;
  String minMode;
  String maxMode;
  int yearRows;
  int yearColumns;
  String maxDate;

  DatePickerEntity({
    required this.minDate,
    required this.disable,
    required this.disableFunction,
    required this.disableWeekends,
    required this.disableWeekdays,
    required this.showWeeks,
    required this.startingDay,
    required this.initDate,
    required this.minMode,
    required this.maxMode,
    required this.yearRows,
    required this.yearColumns,
    required this.maxDate,
  });
}
