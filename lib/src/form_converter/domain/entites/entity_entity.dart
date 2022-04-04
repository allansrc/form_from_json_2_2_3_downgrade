import 'company_entity.dart';
import 'form_entity.dart';
import 'origem_company_entity.dart';

class Entidade {
  int id;
  String titulo;
  FormEntity form;
  OrigemCompanyEntity empresaOrigem;
  List<CompanyEntity> empresas;
  List<String> sistemas;
  bool ativo;
  String miniatura;
  bool exibirMiniatura;

  Entidade({
    required this.id,
    required this.titulo,
    required this.form,
    required this.empresaOrigem,
    required this.empresas,
    required this.sistemas,
    required this.ativo,
    required this.miniatura,
    required this.exibirMiniatura,
  });
}
