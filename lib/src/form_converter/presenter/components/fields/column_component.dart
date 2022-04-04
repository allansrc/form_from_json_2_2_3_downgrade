// ignore_for_file: avoid_types_on_closure_parameters

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../form_from_json.dart';
import '../../../domain/entites/components_entity.dart';
import 'controllers/global_rules_controller.dart';
import 'field_box.dart';

class ColumnComponent extends StatefulWidget {
  final String keyString;
  const ColumnComponent({
    Key? key,
    required this.keyString,
  }) : super(key: key);

  @override
  State<ColumnComponent> createState() => _ColumnComponentState();
}

class _ColumnComponentState extends State<ColumnComponent> {
  late final GlobalFormController globalFormController;
  late final ValueNotifier notifier;
  late ComponentEntity component;

  @override
  void initState() {
    super.initState();
    globalFormController = context.read<GlobalFormController>();
    component = globalFormController.getCurrentComponentInstance(
      widget.keyString,
    );
    notifier = globalFormController.getDependenceTreeValue(component.key) ??
        ValueNotifier('');
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: notifier,
      builder: (context, _) {
        return Visibility(
          visible:
              GlobalRulesController.asConditional(component.conditional.when)
                  ? GlobalRulesController.visible(
                      component,
                      globalFormController.getCurrentComponentInstance(
                        component.conditional.when,
                      ),
                    )
                  : true,
          child: FieldBox(
            color: Colors.transparent,
            padding: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(
                  component.columns.length,
                  (index) {
                    var column = component.columns[index];

                    return Column(
                      children: [
                        ...List.generate(
                          column.components.length,
                          (index) {
                            var newWidgets =
                                globalFormController.getComponentWidgetInstance(
                              column.components[index].key,
                            );
                            return newWidgets;
                          },
                        )
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
