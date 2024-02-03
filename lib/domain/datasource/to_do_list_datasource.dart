import 'package:to_do_list/domain/entities/task.dart';

abstract class ToDoListDataSource {
  Future<Task> addNewTask(String title, String description, DateTime dueDate);
  Future<void> removeTask(Task task);
  Future<void> updateTask(Task task);
}
