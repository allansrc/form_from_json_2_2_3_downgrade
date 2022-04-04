import 'package:flutter/material.dart';

class CheckboxComponentController extends ValueNotifier<bool> {
  CheckboxComponentController(_checked) : super(_checked);

  bool get checked => value;
  bool get groupValue => !value;
  // ignore: type_annotate_public_apis
  changeChecked(newValue) => value = newValue ?? !value;
}
