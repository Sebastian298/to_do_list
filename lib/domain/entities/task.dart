class Task {
  final String title;
  final String description;
  final bool isCompleted;
  final String createdAt;

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.createdAt,
  });
}
