// ignore_for_file: avoid_classes_with_only_static_members

import '../../../../domain/entites/components_entity.dart';

abstract class GlobalRulesController {
  static bool asConditional(String when) {
    if (when.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static bool visible(ComponentEntity current, ComponentEntity dependence) {
    if (dependence.value == current.conditional.eq) {
      return current.conditional.show;
    }
    return !current.conditional.show;
  }

  static String contentSpanCorrect(ComponentEntity component) {
    var text = component.content;
    if (text.isEmpty) {
      return '';
    } else {
      var reg = RegExp(r"<.\w*><.\w*>");
      var hasTag = reg.hasMatch(component.content);
      if (hasTag) {
        text = text.replaceAll(reg, '');
        return text;
      } else {
        return text;
      }
    }
  }
}
