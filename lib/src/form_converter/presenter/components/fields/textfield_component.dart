// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../global_form_controller.dart';
import '../../../domain/entites/components_entity.dart';
import 'controllers/global_rules_controller.dart';
import 'field_box.dart';

class TextfieldComponent extends StatefulWidget {
  final String keyString;
  final TextInputType inputType;
  const TextfieldComponent({
    Key? key,
    required this.keyString,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  State<TextfieldComponent> createState() => _TextfieldComponentState();
}

class _TextfieldComponentState extends State<TextfieldComponent> {
  late final GlobalFormController globalFormController;
  final TextEditingController textController = TextEditingController(text: '');
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
    final currentSize =
        size.height > 1920 ? size.height * .1 : size.height * .12;
    return AnimatedBuilder(
      animation: notifier,
      builder: (context, _) {
        var value = globalFormController.getCurrentValue(component.key);
        textController.text = value.isEmpty
            ? component.defaultValue.toUpperCase()
            : value.toUpperCase();

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
            height: currentSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 30,
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * .03),
                    child: Text(
                      component.label,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
                Flexible(
                  flex: 70,
                  child: InputDecorator(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: currentSize * 0.3,
                        ),
                        border: const OutlineInputBorder()),
                    child: TextField(
                      scrollPadding: EdgeInsets.zero,
                      autofocus:
                          component.key == globalFormController.lastKeyChanged
                              ? true
                              : false,
                      controller: textController,
                      maxLines: component.rows,
                      keyboardType: widget.inputType,
                      enabled: !component.disabled,
                      obscureText: component.protected,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline2,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: size.width * .03,
                        ),
                        prefixText: component.prefix,
                        suffixText: component.suffix,
                        border: InputBorder.none,
                        hintText: component.placeholder,
                        helperText: component.description,
                      ),
                      onChanged: (value) {
                        globalFormController.changeValue(
                          widget.keyString,
                          value,
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
