// import 'package:flutter/material.dart';

// import '../../../domain/entites/components_entity.dart';
// import 'controllers/checkbox_component_controller.dart';
// import 'field_box.dart';

// class CheckboxComponent extends StatelessWidget {
//   final ComponentEntity component;
//   const CheckboxComponent({
//     Key? key,
//     required this.component,
//   }) : super(
//           key: key,
//         );

//   @override
//   Widget build(BuildContext context) {
//     return FormField(builder: (context) {
//       return FieldBox(
//         child: Tooltip(
//           message: component.tooltip,
//           child: ListTile(
//             title: Text(component.label),
//             subtitle: Column(
//               children: List.generate(
//                 component.values.length,
//                 (idx) {
//                   final controller = CheckboxComponentController(false);
//                   return ValueListenableBuilder<bool>(
//                     valueListenable: controller,
//                     builder: (context, value, widget) {
//                       return CheckboxListTile(
//                         value: value,
//                         title: Text(component.values[idx].value),
//                         onChanged: controller.changeChecked,
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
