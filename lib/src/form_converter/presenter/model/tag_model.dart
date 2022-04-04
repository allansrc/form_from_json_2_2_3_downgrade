class TagModel {
  final int id;
  final String title;
  final Function(int id) onDelete;

  TagModel({
    required this.id,
    required this.title,
    required this.onDelete,
  });
}
