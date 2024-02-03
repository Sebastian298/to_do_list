class Task {
  String title;
  String description;
  bool isCompleted;
  final String createdAt;

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.createdAt,
  });
}
