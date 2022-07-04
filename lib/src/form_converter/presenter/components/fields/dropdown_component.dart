import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../form_from_json.dart';
import '../../../../data_by_url/domain/usecases/get_data_by_url_usecase.dart';
import '../../../domain/entites/components_entity.dart';
import '../../states/data_by_url_state.dart';
import '../../store/data_by_url_store.dart';
import 'controllers/global_rules_controller.dart';
import 'field_box.dart';

class DropdownComponent extends StatefulWidget {
  final String keyString;
  const DropdownComponent({
    Key? key,
    required this.keyString,
  }) : super(key: key);

  @override
  State<DropdownComponent> createState() => _DropdownComponentState();
}

class _DropdownComponentState extends State<DropdownComponent> {
  late final GlobalFormController globalFormController;
  late final DataByUrlStore store;
  late final ValueNotifier notifier;
  late ComponentEntity component;

  @override
  void initState() {
    super.initState();
    globalFormController = context.read<GlobalFormController>();
    component = globalFormController.getCurrentComponentInstance(
      widget.keyString,
    );
    final newComponent = component.copyWith(
      title: 'new',
      data: component.data.copyWith(custom: ''),
    );
    globalFormController.updateUrl(newComponent);

    final usecase = context.read<GetDataByUrlUsecase>();

    store = DataByUrlStore(
      usecase: usecase,
      argsParam: globalFormController.getArgsParam(),
      header: globalFormController.getHeader(),
    );

    notifier = globalFormController.getDependenceTreeValue(component.key) ?? ValueNotifier('');
    store.getValues(newComponent);
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
          child: FieldBox(
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
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
                Flexible(
                  flex: 70,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: store,
                      builder: (context, state, _) {
                        //final state = provider.value;
                        if (state is InitialDataByUrlState) {
                          return Center(
                            child: Container(),
                          );
                        } else if (state is ErrorDataByUrlState) {
                          return Center(
                            child: Text(state.message),
                          );
                        } else if (state is LoadingDataByUrlState) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              child: LinearProgressIndicator(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          );
                        } else {
                          if (state is SuccessDataByUrlState) {
                            globalFormController.updateDropdownUrlValues(
                                component, state.data.data!);
                          }
                          if (state is ValueDataByUrlState) {
                            globalFormController.updateDropdownValues(component);
                          }
                          return DropdownButton<String>(
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 25,
                            ),
                            autofocus:
                                component.key == globalFormController.lastKeyChanged ? true : false,
                            underline: const SizedBox.shrink(),
                            isExpanded: true,
                            hint: Text(component.placeholder),
                            value: component.value.isEmpty ? null : component.value,
                            items: component.values.isEmpty
                                ? [
                                    DropdownMenuItem(
                                      child: Text(
                                        component.value.toUpperCase(),
                                        style: Theme.of(context).textTheme.headline3,
                                      ),
                                      value: component.value,
                                    ),
                                  ]
                                : List.generate(
                                    component.values.isEmpty ? 0 : component.values.length,
                                    (idx) => DropdownMenuItem(
                                      child: Text(
                                        component.values[idx].label.toUpperCase(),
                                        style: Theme.of(context).textTheme.headline3,
                                      ),
                                      value: component.values[idx].value,
                                      onTap: () {
                                        if (component.selectValues.isNotEmpty) {
                                          globalFormController.changeValue(
                                            component.selectValues,
                                            '',
                                            diferentData: component.values[idx].shortcut,
                                          );
                                          setState(() {});
                                        }
                                      },
                                    ),
                                  ),
                            onChanged: (value) {
                              if (value != null && value.isNotEmpty) {
                                globalFormController.changeValue(
                                  widget.keyString,
                                  value,
                                );
                              }
                              setState(() {});
                            },
                          );
                        }
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
