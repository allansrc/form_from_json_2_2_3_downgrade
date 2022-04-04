import '../../domain/entites/widget_entity.dart';

// ignore: avoid_classes_with_only_static_members
class WidgetAdapter extends WidgetEntity {
  WidgetAdapter({
    required String type,
    required String displayInTimezone,
    required String locale,
    required bool useLocaleSettings,
    required bool allowInput,
    required String mode,
    required bool enableTime,
    required bool noCalendar,
    required String format,
    required int hourIncrement,
    required int minuteIncrement,
    required bool time24hr,
    required String minDate,
    required String disabledDates,
    required bool disableWeekends,
    required bool disableWeekdays,
    required String disableFunction,
    required String maxDate,
  }) : super(
          type: type,
          displayInTimezone: displayInTimezone,
          locale: locale,
          useLocaleSettings: useLocaleSettings,
          allowInput: allowInput,
          mode: mode,
          enableTime: enableTime,
          noCalendar: noCalendar,
          format: format,
          hourIncrement: hourIncrement,
          minuteIncrement: minuteIncrement,
          time24hr: time24hr,
          minDate: minDate,
          disabledDates: disabledDates,
          disableWeekends: disableWeekends,
          disableWeekdays: disableWeekdays,
          disableFunction: disableFunction,
          maxDate: maxDate,
        );

  factory WidgetAdapter.fromMap(Map<String, dynamic> map) {
    return WidgetAdapter(
      type: map['type'] ?? '',
      displayInTimezone: map['displayInTimezone'] ?? '',
      locale: map['locale'] ?? '',
      useLocaleSettings: map['useLocaleSettings'] ?? false,
      allowInput: map['allowInput'] ?? false,
      mode: map['mode'] ?? '',
      enableTime: map['enableTime'] ?? false,
      noCalendar: map['noCalendar'] ?? false,
      format: map['format'] ?? '',
      hourIncrement: map['hourIncrement']?.toInt() ?? 0,
      minuteIncrement: map['minuteIncrement']?.toInt() ?? 0,
      time24hr: map['time24hr'] ?? false,
      minDate: map['minDate'] ?? '',
      disabledDates: map['disabledDates'] ?? '',
      disableWeekends: map['disableWeekends'] ?? false,
      disableWeekdays: map['disableWeekdays'] ?? false,
      disableFunction: map['disableFunction'] ?? '',
      maxDate: map['maxDate'] ?? '',
    );
  }
}
