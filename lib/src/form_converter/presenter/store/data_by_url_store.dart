// ignore_for_file: omit_local_variable_types, use_setters_to_change_properties

import 'package:flutter/material.dart';

import '../../../core/dtos/access_params_dto.dart';
import '../../../data_by_url/domain/usecases/interfaces/get_data_by_url_usecase_interface.dart';
import '../../domain/entites/components_entity.dart';
import '../states/data_by_url_state.dart';

class DataByUrlStore extends ValueNotifier<DataByUrlState> {
  GetDataByUrlUsecaseInterface usecase;
  Map<String, String> header;
  String argsParam;

  DataByUrlStore({
    required this.usecase,
    required this.header,
    required this.argsParam,
  }) : super(InitialDataByUrlState());

  void _emmit(DataByUrlState state) {
    value = state;
    notifyListeners();
  }

  Future<void> getValues(
    ComponentEntity component,
  ) async {
    if (component.dataSrc != 'url') {
      _emmit(ValueDataByUrlState());
      return;
    }

    _emmit(LoadingDataByUrlState());
    late Map<String, String> headerMap = {};
    if (component.data.headers!.keys.first.isNotEmpty) {
      headerMap = component.data.headers!;
    } else {
      headerMap = header;
    }

    final args = AccessParamsDto(url: component.data.url, headers: headerMap);

    final result = await usecase(args, argsParam);
    result.fold(
      (l) {
        _emmit(ErrorDataByUrlState(l.message));
      },
      (r) {
        _emmit(SuccessDataByUrlState(r));
      },
    );
  }
}
