import 'package:flutter/material.dart';

import '../../../../../domain/entites/components_entity.dart';

///Global validation, shoult be used in local controllers
///Textdata should be used
class ValidationController<T> {
  ComponentEntity component;
  ValidationController(this.component);

  ///for use in components that contains text data
  String? textData;

  AutovalidateMode? get validateMode {
    if (component.validateOn == 'change') {
      return AutovalidateMode.always;
    } else if (component.validateOn == 'blur') {
      return AutovalidateMode.onUserInteraction;
    } else {
      return null;
    }
  }

  bool minimumCharacter() {
    if (component.validate.minLength != null) {
      return textData!.length >= component.validate.minLength!;
    }
    return true;
  }

  bool maximumCharacter() {
    if (component.validate.maxLength != null) {
      return textData!.length <= component.validate.maxLength!;
    }
    return true;
  }

  bool minimumWords() {
    if (component.validate.minLength != null) {
      return textData!.split(' ').length >= component.validate.minWords!;
    }
    return true;
  }

  bool maximumWords() {
    if (component.validate.minLength != null) {
      return textData!.split(' ').length <= component.validate.maxWords!;
    }
    return true;
  }

  bool required() {
    return textData!.isNotEmpty && textData != null;
  }
}
