import 'service_response.dart';

abstract class ClientServiceInterface {
  Future<ServiceResponse> get(
    String url, {
    Map<String, String>? params,
    Map<String, String>? headers,
    Duration? timeout,
    dynamic responseType,
  });
  Future<ServiceResponse> post(
    String url, {
    Map<String, String>? params,
    Map<String, String>? headers,
    Duration? timeout,
    dynamic responseType,
    dynamic data,
  });
}
