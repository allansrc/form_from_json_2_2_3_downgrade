class TimePickerEntity {
  int hourStep;
  int minuteStep;
  bool showMeridian;
  bool readonlyInput;
  bool mousewheel;
  bool arrowkeys;

  TimePickerEntity({
    required this.hourStep,
    required this.minuteStep,
    required this.showMeridian,
    required this.readonlyInput,
    required this.mousewheel,
    required this.arrowkeys,
  });
}
