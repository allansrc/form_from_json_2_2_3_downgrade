// import 'package:flutter/material.dart';

// import '../../../domain/entites/components_entity.dart';
// import '../../model/tag_model.dart';
// import 'controllers/tag_component_controller.dart';
// import 'field_box.dart';
// import 'tag_chip.dart';

// class TagComponent extends StatelessWidget {
//   final ComponentEntity component;
//   TagComponent({
//     Key? key,
//     required this.component,
//   }) : super(
//           key: key,
//         );

//   final controller = TagComponentController(<TagModel>[]);
//   final textController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return FieldBox(
//       child: Column(
//         children: [
//           ListTile(
//             title: TextField(
//               controller: textController,
//             ),
//             trailing: IconButton(
//               icon: const Icon(Icons.add),
//               onPressed: () {
//                 controller.addTag(textController.text);
//               },
//             ),
//           ),
//           ValueListenableBuilder<List<TagModel>>(
//             valueListenable: controller,
//             builder: (ctx, value, _) {
//               return Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Wrap(
//                   children: List.generate(value.length, (idx) {
//                     final tag = value[idx];
//                     return TagChip(
//                       title: tag.title,
//                       onDelete: tag.onDelete,
//                       id: tag.id,
//                     );
//                   }),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
