class ServiceResponse {
  final int status;

  final dynamic data;

  final Map<String, String> headers;

  const ServiceResponse({
    required this.headers,
    required this.status,
    required this.data,
  });
}
