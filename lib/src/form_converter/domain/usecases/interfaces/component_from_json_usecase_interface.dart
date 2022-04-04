import 'package:dartz/dartz.dart';

import '../../../../core/errors/form_from_json_error.dart';
import '../../entites/form_entity.dart';

// ignore: one_member_abstracts
abstract class FormFromJsonUsecaseInterface {
  Either<FormFromJsonError, FormEntity> call(Map<String, dynamic> json);
}
