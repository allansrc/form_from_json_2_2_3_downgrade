import 'package:flutter/material.dart';

T? mapTreatment<T>(Map<String, dynamic> map, String key, [T? def]) {
  if (map.containsKey(key)) {
    return map[key] ?? def;
  }
  debugPrint('WARNING: MAPPER TREATMENT FIELD [$key] NOT MEETING [$def] WILL BE RETURNED');
  return def;
}
