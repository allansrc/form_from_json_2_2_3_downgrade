// import 'package:flutter/material.dart';

// Output? adapterConverter<Output>(dynamic input, Output? def) {
//   if (input == null && def == null) {
//     return null;
//   }

//   if (input.runtimeType != def.runtimeType && def != null) {
//     debugPrint(
//         'Inconsistent input with return => input type ${input.runtimeType.toString()} expected ${def.runtimeType.toString()}');
//     debugPrint('Input data: $input');
//     return null;
//   }

//   if (input == null && def != null) {
//     return def;
//   }

//   return input;
// }

// adapptativeCoverter<Default, IsNull>(dynamic input, Default def, IsNull isNull) {
//   if (input == null) return null;
//   if (input is List) return List.from(input);
// }
