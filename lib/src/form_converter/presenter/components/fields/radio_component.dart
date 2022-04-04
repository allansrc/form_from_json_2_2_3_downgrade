// import 'package:flutter/material.dart';

// import '../../../domain/entites/components_entity.dart';
// import 'controllers/radio_component_controller.dart';
// import 'field_box.dart';

// class RadioComponent extends StatelessWidget {
//   final ComponentEntity component;
//   const RadioComponent({
//     Key? key,
//     required this.component,
//   }) : super(
//           key: key,
//         );

//   @override
//   Widget build(BuildContext context) {
//     final controller = RadioComponentController(component.values.first.value);
//     return FieldBox(
//       child: Tooltip(
//         message: component.tooltip,
//         child: ListTile(
//           title: Text(component.label),
//           subtitle: Column(
//             children: List.generate(
//               component.values.length,
//               (idx) {
//                 return ValueListenableBuilder(
//                     valueListenable: controller,
//                     builder: (_, value, __) {
//                       return RadioListTile<String>(
//                         value: component.values[idx].value,
//                         title: Text(component.values[idx].label),
//                         onChanged: controller.changeChecked,
//                         groupValue: controller.value,
//                       );
//                     });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
