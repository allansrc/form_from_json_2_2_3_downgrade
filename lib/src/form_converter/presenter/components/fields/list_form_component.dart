import 'package:flutter/material.dart';

class ListFormComponent extends StatelessWidget {
  final List<Widget> components;
  const ListFormComponent({
    Key? key,
    required this.components,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(children: components);
  }
}
