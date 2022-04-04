// ignore_for_file: omit_local_variable_types, avoid_types_on_closure_parameters

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../form_from_json.dart';
import '../../../domain/entites/components_entity.dart';
import 'controllers/global_rules_controller.dart';
import 'field_box.dart';

class TabComponent extends StatefulWidget {
  final String keyString;
  const TabComponent({Key? key, required this.keyString})
      : super(
          key: key,
        );

  @override
  State<TabComponent> createState() => _TabComponentState();
}

class _TabComponentState extends State<TabComponent>
    with TickerProviderStateMixin {
  late final GlobalFormController globalFormController;
  late final TabController tabController;
  late final ValueNotifier notifier;
  late ComponentEntity component;

  @override
  void initState() {
    super.initState();
    globalFormController = context.read<GlobalFormController>();
    component = globalFormController.getCurrentComponentInstance(
      widget.keyString,
    );
    tabController = TabController(
      initialIndex: component.tabindex,
      length: component.components.length,
      vsync: this,
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
            margin: const EdgeInsets.only(top: 10),
            padding: false,
            border: false,
            height: size.height * .6,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: size.height * .2,
                maxHeight: size.height * .8,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey),
                        ),
                      ),
                      child: TabBar(
                        indicatorColor:
                            Theme.of(context).tabBarTheme.labelColor,
                        labelStyle: Theme.of(context).textTheme.headline3,
                        controller: tabController,
                        isScrollable: true,
                        onTap: (index) {
                          globalFormController.changeTab(
                            widget.keyString,
                            index,
                          );
                        },
                        tabs: List.generate(
                          component.components.length,
                          (index) {
                            return Text(
                              component.components[index].label,
                              // style: Theme.of(context).textTheme.headline3,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 90,
                    child: TabBarView(
                      controller: tabController,
                      children: List.generate(
                        component.components.length,
                        (index) {
                          final singleComponent = component.components[index];
                          return globalFormController
                              .getComponentWidgetInstance(
                            singleComponent.key,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
