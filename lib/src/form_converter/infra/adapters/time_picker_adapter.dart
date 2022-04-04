import '../../domain/entites/time_picker_entity.dart';

class TimePickerAdapter extends TimePickerEntity {
  TimePickerAdapter({
    required int hourStep,
    required int minuteStep,
    required bool showMeridian,
    required bool readonlyInput,
    required bool mousewheel,
    required bool arrowkeys,
  }) : super(
          hourStep: hourStep,
          minuteStep: minuteStep,
          showMeridian: showMeridian,
          readonlyInput: readonlyInput,
          mousewheel: mousewheel,
          arrowkeys: arrowkeys,
        );

  factory TimePickerAdapter.fromMap(Map<String, dynamic> map) {
    return TimePickerAdapter(
      hourStep: map['hourStep']?.toInt() ?? 0,
      minuteStep: map['minuteStep']?.toInt() ?? 0,
      showMeridian: map['showMeridian'] ?? false,
      readonlyInput: map['readonlyInput'] ?? false,
      mousewheel: map['mousewheel'] ?? false,
      arrowkeys: map['arrowkeys'] ?? false,
    );
  }
}
