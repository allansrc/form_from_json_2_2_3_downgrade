class FormData {
  final Map<String, dynamic> fields;
  final Map<String, dynamic> data;
  final Map<String, String> header;
  final String? argumentParam;

  FormData(this.fields, this.data, this.header, {this.argumentParam});
}
