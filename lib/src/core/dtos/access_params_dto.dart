class AccessParamsDto {
  final String url;
  final Map<String, String>? headers;

  AccessParamsDto({
    required this.url,
    this.headers,
  });
}
