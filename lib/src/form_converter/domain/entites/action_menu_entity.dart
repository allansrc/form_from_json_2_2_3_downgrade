import 'properties_entity.dart';

class ActionMenuEntity {
  String id;
  String titulo;
  String nomeFuncao;
  PropertiesEntity predicate;
  bool validarForm;

  ActionMenuEntity({
    required this.id,
    required this.titulo,
    required this.nomeFuncao,
    required this.predicate,
    required this.validarForm,
  });
}
