import '../../domain/entites/date_picker_entity.dart';

// ignore: avoid_classes_with_only_static_members
class DatePickerAdapter extends DatePickerEntity {
  DatePickerAdapter({
    required String minDate,
    required String disable,
    required String disableFunction,
    required bool disableWeekends,
    required bool disableWeekdays,
    required bool showWeeks,
    required int startingDay,
    required String initDate,
    required String minMode,
    required String maxMode,
    required int yearRows,
    required int yearColumns,
    required String maxDate,
  }) : super(
          minDate: minDate,
          disable: disable,
          disableFunction: disableFunction,
          disableWeekends: disableWeekends,
          disableWeekdays: disableWeekdays,
          showWeeks: showWeeks,
          startingDay: startingDay,
          initDate: initDate,
          minMode: minMode,
          maxMode: maxMode,
          yearRows: yearRows,
          yearColumns: yearColumns,
          maxDate: maxDate,
        );
  factory DatePickerAdapter.fromMap(Map<String, dynamic> map) {
    return DatePickerAdapter(
      minDate: map['minDate'] ?? '',
      disable: map['disable'] ?? '',
      disableFunction: map['disableFunction'] ?? '',
      disableWeekends: map['disableWeekends'] ?? false,
      disableWeekdays: map['disableWeekdays'] ?? false,
      showWeeks: map['showWeeks'] ?? false,
      startingDay: map['startingDay']?.toInt() ?? 0,
      initDate: map['initDate'] ?? '',
      minMode: map['minMode'] ?? '',
      maxMode: map['maxMode'] ?? '',
      yearRows: map['yearRows']?.toInt() ?? 0,
      yearColumns: map['yearColumns']?.toInt() ?? 0,
      maxDate: map['maxDate'] ?? '',
    );
  }
}
