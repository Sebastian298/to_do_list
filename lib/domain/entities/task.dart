class Task {
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.createdAt,
  });
}
