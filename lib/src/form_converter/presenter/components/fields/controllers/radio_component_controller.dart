import 'package:flutter/material.dart';

class RadioComponentController<T> extends ValueNotifier<T> {
  RadioComponentController(_checked) : super(_checked);

  T get checked => value;
  // ignore: type_annotate_public_apis
  changeChecked(newValue) => value = newValue;
}
