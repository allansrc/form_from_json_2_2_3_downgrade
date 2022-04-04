import 'package:flutter/material.dart';

class FieldBox extends StatelessWidget {
  final double? height;
  final Widget? child;
  final bool border;
  final bool padding;
  final String tooltip;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;
  const FieldBox({
    Key? key,
    this.height,
    this.child,
    this.border = true,
    this.padding = true,
    this.tooltip = '',
    this.color = Colors.transparent,
    this.boxShadow,
    this.borderRadius,
    this.margin,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Tooltip(
        waitDuration: const Duration(
          milliseconds: 500,
        ),
        message: tooltip,
        child: Container(
          margin: margin ?? const EdgeInsets.only(top: 10),
          constraints: const BoxConstraints.tightFor(),
          padding: EdgeInsets.only(
            left: padding ? size.height * 1 / 100 : 0,
            right: padding ? size.height * 1 / 100 : 0,
          ),
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          width: size.width * 95 / 100,
          height: height,
          decoration: BoxDecoration(
              color: color,
              // border: border
              //     ? const Border(
              //         bottom: BorderSide(
              //           color: Colors.grey,
              //         ),
              //       )
              //     : null,
              boxShadow: boxShadow,
              borderRadius: borderRadius),
          child: child,
        ),
      ),
    );
  }
}
