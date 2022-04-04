// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../data_by_url/domain/entities/data_by_url_entity.dart';

abstract class DataByUrlState {}

class SuccessDataByUrlState extends DataByUrlState {
  DataByUrlEntity data;
  SuccessDataByUrlState(this.data);
}

class InitialDataByUrlState extends DataByUrlState {}

class ValueDataByUrlState extends DataByUrlState {}

class LoadingDataByUrlState extends DataByUrlState {}

class ErrorDataByUrlState extends DataByUrlState {
  String message;
  ErrorDataByUrlState(this.message);
}
