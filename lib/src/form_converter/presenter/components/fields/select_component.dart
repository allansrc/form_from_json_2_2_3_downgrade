import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../form_from_json.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../domain/entites/components_entity.dart';
import 'controllers/checkbox_component_controller.dart';
import 'controllers/global_rules_controller.dart';
import 'field_box.dart';

class SelectComponent extends StatefulWidget {
  final String keyString;
  const SelectComponent({
    Key? key,
    required this.keyString,
  }) : super(key: key);

  @override
  State<SelectComponent> createState() => _SelectComponentState();
}

class _SelectComponentState extends State<SelectComponent> {
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
        var value = globalFormController.getCurrentValue(component.key);
        value = value.isEmpty
            ? component.defaultValue.toString()
            : value.toString();
        final controller = CheckboxComponentController(value.toBool());
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
            padding: true,
            tooltip: component.tooltip,
            height: size.height * .1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(
                  flex: 30,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 70,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    child: ValueListenableBuilder<bool>(
                      valueListenable: controller,
                      builder: (context, value, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              component.label,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Checkbox(
                              visualDensity: VisualDensity.compact,
                              value: value,
                              onChanged: (value) {
                                controller.changeChecked(value);
                                globalFormController.changeValue(
                                  widget.keyString,
                                  value.toString(),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
