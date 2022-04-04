import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../global_form_controller.dart';
import '../components/fields/list_form_component.dart';

class FormWidgetPage extends StatefulWidget {
  const FormWidgetPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FormWidgetPage> createState() => _FormWidgetPageState();
}

class _FormWidgetPageState extends State<FormWidgetPage> {
  late final GlobalFormController globalFormController;

  @override
  void initState() {
    super.initState();
    globalFormController = context.read<GlobalFormController>();
    globalFormController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white10,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListFormComponent(
                components: globalFormController.getWidgets(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
