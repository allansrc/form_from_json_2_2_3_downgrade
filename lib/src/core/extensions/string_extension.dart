extension IntFromStringNull on String? {
  int toInt() => int.tryParse(this ?? '') ?? 0;
}

extension IntFromString on String {
  int toInt() => int.tryParse(this) ?? 0;
}

extension BoolFromString on String {
  bool toBool() {
    if (this == 'false') {
      return false;
    } else {
      return true;
    }
  }
}
