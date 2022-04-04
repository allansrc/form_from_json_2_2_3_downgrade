// ignore_for_file: omit_local_variable_types, avoid_types_on_closure_parameters

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../form_from_json.dart';
import '../../../domain/entites/components_entity.dart';
import 'controllers/global_rules_controller.dart';
import 'field_box.dart';

class ContainerComponent extends StatefulWidget {
  final String keyString;
  const ContainerComponent({
    Key? key,
    required this.keyString,
  }) : super(key: key);

  @override
  State<ContainerComponent> createState() => _ContainerComponentState();
}

class _ContainerComponentState extends State<ContainerComponent> {
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
    final size = MediaQuery.of(context).size;
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
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: size.height * .7),
              child: FieldBox(
                border: false,
                padding: false,
                color: Colors.transparent,
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 1),
                          height: constraint.maxHeight - 1,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: component.components.length,
                            itemBuilder: (context, idx) {
                              var newWidgets = globalFormController
                                  .getComponentWidgetInstance(
                                component.components[idx].key,
                              );
                              return newWidgets;
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        });
  }
}
