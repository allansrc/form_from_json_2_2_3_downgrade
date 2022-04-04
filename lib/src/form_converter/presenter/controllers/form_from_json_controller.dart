import 'package:flutter/material.dart';

class FormFromJsonController {
  Map<String, dynamic> response = {"data": {}};

  void onSubmit(String key, dynamic value) {
    var newSubmit = {key: value};
    response["data"]!.addAll(newSubmit);
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onSave() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }
}
