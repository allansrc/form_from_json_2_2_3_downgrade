class WidgetEntity {
  String type;
  String displayInTimezone;
  String locale;
  bool useLocaleSettings;
  bool allowInput;
  String mode;
  bool enableTime;
  bool noCalendar;
  String format;
  int hourIncrement;
  int minuteIncrement;
  bool time24hr;
  String minDate;
  String disabledDates;
  bool disableWeekends;
  bool disableWeekdays;
  String disableFunction;
  String maxDate;

  WidgetEntity({
    required this.type,
    required this.displayInTimezone,
    required this.locale,
    required this.useLocaleSettings,
    required this.allowInput,
    required this.mode,
    required this.enableTime,
    required this.noCalendar,
    required this.format,
    required this.hourIncrement,
    required this.minuteIncrement,
    required this.time24hr,
    required this.minDate,
    required this.disabledDates,
    required this.disableWeekends,
    required this.disableWeekdays,
    required this.disableFunction,
    required this.maxDate,
  });
}
