// import 'package:flutter/material.dart';

// class TagChip extends StatelessWidget {
//   final int id;
//   final String title;
//   final Function(int id) onDelete;
//   const TagChip({Key? key, required this.title, required this.onDelete, required this.id})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Container(
//         margin: const EdgeInsets.all(5),
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(
//           title,
//           textAlign: TextAlign.center,
//         ),
//       ),
//       onTap: () => onDelete(id),
//     );
//   }
// }
