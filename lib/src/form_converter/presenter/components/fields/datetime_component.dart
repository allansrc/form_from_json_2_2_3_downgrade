import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../form_from_json.dart';
import '../../../domain/entites/components_entity.dart';
import 'controllers/global_rules_controller.dart';
import 'field_box.dart';

class DatetimeComponent extends StatefulWidget {
  final String keyString;
  const DatetimeComponent({
    Key? key,
    required this.keyString,
  }) : super(key: key);
  @override
  State<DatetimeComponent> createState() => _DatetimeComponentState();
}

class _DatetimeComponentState extends State<DatetimeComponent> {
  late final GlobalFormController globalFormController;
  late final TextEditingController dateController;
  late ComponentEntity component;
  late final ValueNotifier notifier;
  DateTime selectedDate = DateTime.now();

  Future selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        currentDate: DateTime.now(),
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xff6360FE),
              ),
            ),
            child: child!,
          );
        });
    if (picked != null) {
      setState(
        () {
          selectedDate = picked;
          dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    globalFormController = context.read<GlobalFormController>();
    component = globalFormController.getCurrentComponentInstance(
      widget.keyString,
    );
    var value = globalFormController.getCurrentValue(component.key);
    dateController = TextEditingController(
      text: value.isEmpty
          ? component.defaultValue
          : DateFormat('dd/MM/yyyy').format(
              DateTime.parse(value),
            ),
    );
    notifier = globalFormController.getDependenceTreeValue(component.key) ?? ValueNotifier('');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentSize = size.height > 1920 ? size.height * .1 : size.height * .12;
    return AnimatedBuilder(
      animation: notifier,
      builder: (context, _) {
        return Visibility(
          visible: GlobalRulesController.asConditional(component.conditional.when)
              ? GlobalRulesController.visible(
                  component,
                  globalFormController.getCurrentComponentInstance(
                    component.conditional.when,
                  ),
                )
              : true,
          child: InkWell(
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
                      padding: EdgeInsets.only(
                        left: size.width * .03,
                      ),
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
                        contentPadding: EdgeInsets.only(top: currentSize * .3),
                        border: const OutlineInputBorder(),
                      ),
                      child: TextField(
                        scrollPadding: EdgeInsets.zero,
                        autofocus:
                            component.key == globalFormController.lastKeyChanged ? true : false,
                        controller: dateController,
                        enabled: false,
                        obscureText: component.protected,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline3,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: size.width * .03,
                          ),
                          prefixText: component.prefix,
                          suffixText: component.suffix,
                          border: InputBorder.none,
                          hintText: component.placeholder,
                          helperText: component.description,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () async {
              FocusScope.of(context).unfocus();
              await selectDate(context);
              globalFormController.changeValue(
                widget.keyString,
                selectedDate.toIso8601String(),
              );
            },
          ),
        );
      },
    );
  }
}
