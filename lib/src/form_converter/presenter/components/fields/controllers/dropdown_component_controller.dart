// // ignore_for_file: omit_local_variable_types

// import '../../../../../core/dtos/access_params_dto.dart';
// import '../../../../../data_by_url/domain/entities/data_by_url_entity.dart';
// import '../../../../../data_by_url/domain/usecases/interfaces/get_data_by_url_usecase_interface.dart';
// import '../../../../domain/entites/components_entity.dart';

// class DropdownComponentController {
//   GetDataByUrlUsecaseInterface usecase;

//   DropdownComponentController({
//     required this.usecase,
//   });

  
//   Future<List<DataByUrlEntity>> getValues(ComponentEntity component) async {
//     late Map<String, String> headerMap = {};
//     if (component.data.headers != null && component.data.headers!.isNotEmpty) {
//       for (var header in component.data.headers!) {
//         var map = {"${header['key']}": "${header['value']}"};
//         if (map.keys.first != '') {
//           headerMap.addAll(map);
//         }
//       }
//       final args = AccessParamsDto(url: component.data.url, headers: headerMap);

//       final result = await usecase(args);
//       return result.fold((l) => [], (r) => r);
//     }
//     return [];
//   }
// }
