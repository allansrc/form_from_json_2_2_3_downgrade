// ignore_for_file: omit_local_variable_types, avoid_types_on_closure_parameters

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../form_from_json.dart';
import '../../../domain/entites/components_entity.dart';
import 'controllers/global_rules_controller.dart';
import 'field_box.dart';

class HtmlComponent extends StatefulWidget {
  final String keyString;
  const HtmlComponent({
    Key? key,
    required this.keyString,
  }) : super(key: key);

  @override
  State<HtmlComponent> createState() => _HtmlComponentState();
}

class _HtmlComponentState extends State<HtmlComponent> {
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
          child: FieldBox(
            border: false,
            padding: false,
            height: size.height * 0.15,
            color: Colors.transparent,
            child: Center(
              child: Text(
                GlobalRulesController.contentSpanCorrect(component),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
