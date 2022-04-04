import 'package:uno/uno.dart';

import '../client_service_interface.dart';
import '../errors/service_error.dart';
import '../service_response.dart';

class UnoClient implements ClientServiceInterface {
  final uno = Uno();

  @override
  Future<ServiceResponse> get(String url,
      {Map<String, String>? params,
      Map<String, String>? headers,
      Duration? timeout,
      dynamic responseType}) async {
    try {
      final result = await uno.get(
        url,
        params: params ?? const {},
        headers: headers ?? const {},
        timeout: timeout,
        responseType: responseType ?? ResponseType.json,
      );

      return ServiceResponse(
        headers: result.headers,
        status: result.status,
        data: result.data,
      );
    } on UnoError catch (e, s) {
      throw ServiceError(message: e.message, stackTrace: s, error: e);
    }
  }

  @override
  Future<ServiceResponse> post(String url,
      {Map<String, String>? params,
      Map<String, String>? headers,
      Duration? timeout,
      dynamic responseType,
      dynamic data}) async {
    try {
      final result = await uno.post(
        url,
        params: params ?? const {},
        headers: headers ?? const {},
        timeout: timeout,
        responseType: responseType ?? ResponseType.json,
        data: data,
      );

      return ServiceResponse(
        headers: result.headers,
        status: result.status,
        data: result.data,
      );
    } on UnoError catch (e, s) {
      throw ServiceError(message: e.message, stackTrace: s, error: e);
    }
  }
}
