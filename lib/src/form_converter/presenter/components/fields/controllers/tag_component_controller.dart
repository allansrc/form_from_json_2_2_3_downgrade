// ignore_for_file: type_annotate_public_apis

import 'package:flutter/material.dart';

import '../../../model/tag_model.dart';

class TagComponentController extends ValueNotifier<List<TagModel>> {
  TagComponentController(value) : super(value);

  List<TagModel> get tags => value;

  addTag(String title) {
    final tag = TagModel(
      id: value.length,
      title: title,
      onDelete: deleteTag,
    );
    value.add(tag);
    notifyListeners();
  }

  deleteTag(int id) {
    value.removeAt(id);
    notifyListeners();
  }
}
