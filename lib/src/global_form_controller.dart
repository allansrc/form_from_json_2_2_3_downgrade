// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_final_fields
import 'package:flutter/material.dart';

import '../form_from_json.dart';
import 'form_converter/domain/entites/columns_entity.dart';
import 'form_converter/domain/entites/components_entity.dart';
import 'form_converter/domain/entites/form_entity.dart';
import 'form_converter/domain/entites/values_entity.dart';
import 'form_converter/infra/adapters/form_adapter.dart';
import 'form_converter/presenter/components/fields/column_component.dart';
import 'form_converter/presenter/components/fields/container_component.dart';
import 'form_converter/presenter/components/fields/datetime_component.dart';
import 'form_converter/presenter/components/fields/dropdown_component.dart';
import 'form_converter/presenter/components/fields/html_component.dart';
import 'form_converter/presenter/components/fields/select_component.dart';
import 'form_converter/presenter/components/fields/tab_component.dart';
import 'form_converter/presenter/components/fields/textfield_component.dart';

class GlobalFormController {
  BuildContext context;
  FormData formData;
  Submission submission;

  GlobalFormController({
    required this.context,
    required this.formData,
    required this.submission,
  });
  late final FormEntity form;
  Map<String, ComponentData> componentsTree = {};
  String lastKeyChanged = '';
  bool isRead = false;
  Map<String, ValueNotifier<String>> _dependenceTree = {};

  ///Should be call in first page of the package
  void init() {
    _generateFormEntity();
    _generateComponentsDataTree(form.schema!.components);
    _generateSubmissionData();
    if (formData.data.isNotEmpty) {
      isRead = true;
    }
    _generateDependenceTree();
  }

  ComponentEntity _updateInitialValueByLocalData(ComponentEntity component) {
    Map currentMap = formData.data;
    if (formData.data.isEmpty) {
      return component;
    } else {
      final value = _getLocalDataValue(component.key, currentMap);
      component.value = value;
      return component;
    }
  }

  Map<String, String> getHeader() {
    return formData.header;
  }

  String getArgsParam() {
    return formData.argumentParam ?? '';
  }

  String getCurrentValue(String key) {
    return _getLocalDataValue(key, submission.data);
  }

  String _getLocalDataValue(String componentKey, Map currentMap) {
    if (componentKey.contains('.')) {
      List keys = componentKey.split('.');

      for (var index = 0; index < keys.length - 1; index++) {
        final key = keys[index];

        if (currentMap[key] == null || currentMap[key] is! Map) {
          continue;
        } else {
          currentMap = currentMap[key];
        }
      }

      if (currentMap[keys.last] == null || currentMap[keys.last] is! String) {
        return '';
      } else {
        return currentMap[keys.last];
      }
    } else {
      if (currentMap[componentKey] == null || currentMap[componentKey] is! String) {
        return '';
      } else {
        return currentMap[componentKey];
      }
    }
  }

  void updateDropdownUrlValues(
    ComponentEntity component,
    Map<String, dynamic> map,
  ) async {
    submission.metadata.addAll(map);
    if (map.isNotEmpty) {
      var results = _getListDropdownUrlResults(component, map);
      component.values = _generateListValuesEntity(results, component);
    } else {
      component.values = component.data.values;
    }
  }

  List<ValuesEntity> _generateListValuesEntity(
    List<Map<String, dynamic>> valuesMap,
    ComponentEntity component,
  ) {
    if (valuesMap.isEmpty) {
      return [];
    }
    if (component.valueProperty.isEmpty) {
      return List<ValuesEntity>.from(
        valuesMap.map(
          (e) {
            String value;
            if (component.template.isNotEmpty) {
              value = _template(component.template, e);
            } else {
              value = e.values.elementAt(0).toString();
            }
            return ValuesEntity(label: value, value: e.keys.elementAt(0).toString(), shortcut: e);
          },
        ),
      );
    } else {
      return List<ValuesEntity>.from(
        valuesMap.map(
          (e) {
            String value;
            if (component.template.isNotEmpty) {
              value = _template(component.template, e);
            } else {
              value = e.values.elementAt(0).toString();
            }
            return ValuesEntity(
                label: value, value: e[component.valueProperty].toString(), shortcut: e);
          },
        ),
      );
    }
  }

  List<Map<String, dynamic>> _getListDropdownUrlResults(
    ComponentEntity component,
    Map<String, dynamic> map,
  ) {
    if (component.selectValues.isEmpty) {
      if (map.containsKey('values')) {
        var converterChildrensFromMap = map['values'];
        var childrensConverted = <Map<String, dynamic>>[];
        for (var child in converterChildrensFromMap) {
          final tempChild = child as Map<String, dynamic>;
          childrensConverted.add(tempChild);
        }
        return childrensConverted;
      }
      return map.values as List<Map<String, dynamic>>;
    } else {
      List result = map[component.selectValues];
      final results = List<Map<String, dynamic>>.from(
        result.map((e) => e as Map<String, dynamic>),
      );
      return results;
    }
  }

  void updateUrl(ComponentEntity component) {
    final url = component.data.url;
    if (url.isNotEmpty) {
      final regDependence = RegExp(r"\{\{ data\['[^']*'] \}\}");
      var hasDependenceValue = regDependence.hasMatch(url);
      if (hasDependenceValue) {
        final regDependenceKey = RegExp(r"'[^']*'");
        final key = regDependenceKey.allMatches(url).first.group(0)!.replaceAll("'", "");
        final dependeceValue = _getLocalDataValue(
          key,
          submission.data,
        );
        final newUrl = url.replaceAllMapped(
          regDependence,
          (match) => dependeceValue,
        );
        component.data.url = newUrl;
      }
    }
  }

  String _template(String template, Map data) {
    //TODO: correct reg
    var reg1 = RegExp(r"<.\w*>");
    var reg2 = RegExp(r"[ {}]*");
    var reg3 = RegExp(r"item.");
    template = template
        .replaceAllMapped(reg1, (match) => '')
        .replaceAllMapped(reg2, (match) => '')
        .replaceAllMapped(reg3, (match) => '');

    var templatesFields = template.split('-');
    var newTemplate = '';
    for (var field in templatesFields) {
      final value = _getLocalDataValue(field, data);
      newTemplate += '$value ';
    }
    return newTemplate;
  }

  void updateDropdownValues(ComponentEntity component) async {
    component.values = component.data.values;

    if (component.value.isEmpty) {
      if (component.data.values.isNotEmpty) {
        component.value = component.data.values.first.value;
      }
    }
  }

  bool dropdownUseUrlData(ComponentEntity component) {
    if (component.dataSrc == 'url') {
      return true;
    } else {
      return false;
    }
  }

  ///Increment local data with later queries
  void addLocalData(Map<String, dynamic> newData) {
    formData.data.addAll(newData);
  }

  ///Verify has dependece of the key in dependence tree
  bool hasDependence(String key) {
    return _dependenceTree.containsValue(key);
  }

  _generateDependenceTree() {
    for (var componentData in componentsTree.values) {
      if (componentData.component.conditional.when.isNotEmpty) {
        _dependenceTree.update(
          componentData.objectKey,
          (value) => ValueNotifier(componentData.component.conditional.when),
          ifAbsent: () => ValueNotifier(componentData.component.conditional.when),
        );
      }
      if (componentData.component.redrawOn.isNotEmpty) {
        _dependenceTree.update(
          componentData.objectKey,
          (value) => ValueNotifier(componentData.component.redrawOn),
          ifAbsent: () => ValueNotifier(componentData.component.redrawOn),
        );
      }
    }
    print(_dependenceTree);
  }

  void _updateDependenceTree(String foreignKey, dynamic newValue) {
    _dependenceTree.forEach(
      (key, value) {
        if (value.value == foreignKey) {
          // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
          value.notifyListeners();
        }
      },
    );
  }

  ValueNotifier? getDependenceTreeValue(String key) {
    return _dependenceTree[key];
  }

  ///Generate main form for use in page for visual construction
  _generateFormEntity() {
    if (formData.fields.containsKey('form')) {
      //TODO: call usecase
      final result = FormAdapter.fromMap(formData.fields['form']);
      form = result;
    } else {
      throw Exception('Map Form dont contains key [form]');
    }
  }

  ///Generate main tree, for controller of data values and keys controller
  _generateComponentsDataTree(List<dynamic> data) {
    for (var component in data) {
      if (component is ComponentEntity) {
        var key = component.key;
        var widget = _getComponentWidget(key, component.type, component);
        var value = ComponentData(
          objectKey: key,
          path: '',
          object: widget,
          component: _updateInitialValueByLocalData(component),
        );
        componentsTree.addAll({key: value});
        if (component.components.isNotEmpty) {
          _generateComponentsDataTree(component.components);
        }
        if (component.columns.isNotEmpty) {
          _generateComponentsDataTree(component.columns);
        }
      }
      if (component is ColumnsEntity) {
        _generateComponentsDataTree(component.components);
      }
    }
  }

  ///Generate submission data if no data has included in created
  _generateSubmissionData() {
    for (var element in componentsTree.values) {
      var keys = element.objectKey.split('.');
      if (keys.first.startsWith('columns')) continue;
      _updateMap(submission.data, element.component.value, keys);
    }
  }

  ///A facilitator to update information at any level of a map
  void _updateMap(Map<String, dynamic> map, dynamic newValue, List<String> keys) {
    for (var index = 0; index < keys.length; index++) {
      var currentKey = keys.elementAt(index);
      var last = index == keys.length - 1;
      if (last) {
        map[currentKey] = newValue;
      } else {
        if (map[currentKey] == null || map[currentKey] == '') {
          map[currentKey] = <String, dynamic>{};
        }
        keys.removeAt(0);
        var subMap = map[currentKey];
        _updateMap(subMap, newValue, keys);
      }
    }
  }

  ///Change value in component of component data tree and submit tree
  void changeValue(String key, dynamic value, {Map? diferentData}) {
    _updateComponentValue(key, value);
    _updateSubmit(key, diferentData ?? value);
    _updateDependenceTree(key, value);
    lastKeyChanged = key;
  }

  ///When a tab is changed in the widget, it will be mirrored in the component
  ///in the component data
  void changeTab(String key, dynamic value) {
    _updateComponentTab(key, value);
  }

  ///Updata value in componentData tree
  void _updateComponentValue(String key, dynamic value) {
    var component = getCurrentComponentInstance(key);
    component.value = value;
  }

  ///Change tab value in component in component data
  void _updateComponentTab(String key, dynamic value) {
    var component = getCurrentComponentInstance(key);
    component.tabindex = value;
  }

  ///Updata submission value
  _updateSubmit(String key, dynamic newValue) {
    var keys = key.split('.');
    _updateMap(submission.data, newValue, keys);
    print(submission.data);
  }

  ///Get inital list components, from here subwidget must be built from their
  ///predecessors
  List<Widget> getWidgets() {
    var listWidget = <Widget>[];
    for (var component in form.schema!.components) {
      listWidget.add(
        getComponentWidgetInstance(
          component.key,
        ),
      );
    }
    return listWidget;
  }

  ComponentEntity getCurrentComponentInstance(String key) {
    if (componentsTree.containsKey(key)) {
      return componentsTree[key]!.component;
    } else {
      throw Exception('Key not found');
    }
  }

  ///Search with key and return widget of the componentData tree
  Widget getComponentWidgetInstance(String key) {
    if (componentsTree.containsKey(key)) {
      return componentsTree[key]!.object;
    } else {
      return const Text('Key not found');
    }
  }

  ///List of components relateds the your types
  Widget _getComponentWidget(String key, String type, ComponentEntity component) {
    switch (type) {
      case 'textfield':
        return TextfieldComponent(keyString: key);
      case 'container':
        return ContainerComponent(keyString: key);
      case 'textarea':
        return TextfieldComponent(keyString: key);
      case 'number':
        return TextfieldComponent(
          keyString: key,
          inputType: TextInputType.number,
        );
      case 'password':
        return TextfieldComponent(keyString: key);
      case 'checkbox':
        return SelectComponent(keyString: key);
      // case 'selectboxes':
      //   return CheckboxComponent();
      case 'select':
        return DropdownComponent(keyString: key);
      // case 'radio':
      //   return RadioComponent();
      // case 'signature':
      // case 'tags':
      //   return TagComponent();
      // case 'currency':
      // case 'time':
      case 'datetime':
        return DatetimeComponent(keyString: key);
      // case 'day':
      // case 'url':
      case 'email':
        return TextfieldComponent(keyString: key);
      case 'phoneNumber':
        return TextfieldComponent(keyString: key);
      // case 'file':
      case 'columns':
        return ColumnComponent(keyString: key);
      case 'tabs':
        return TabComponent(keyString: key);
      // case 'fieldset':
      // case 'tree':
      // case 'panel':
      // case 'table':
      case 'htmlelement':
        return HtmlComponent(keyString: key);
      default:
        return Text(type);
    }
  }
}

class Submission {
  Map<String, dynamic> data = {};
  Map<String, dynamic> metadata = {};
  Submission();

  Map<String, dynamic> onSubmit() {
    return data;
  }
}

class ComponentData {
  String objectKey;
  String path;
  Widget object;
  ComponentEntity component;

  ComponentData({
    required this.objectKey,
    required this.path,
    required this.object,
    required this.component,
  });
}
