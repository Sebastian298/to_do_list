import 'package:to_do_list/domain/entities/task.dart';
import 'package:to_do_list/presentation/providers/to_do_list_provider.dart';

abstract class ToDoListDataSource {
  Future<Task> addNewTask(String title, String description, String dueDate);
  Future<void> toggleTaskCompletition(
      Task task, ToDoListProvider toDoListProvider);
  Future<void> removeTask(Task task, ToDoListProvider toDoListProvider);
  Future<void> updateTask(Task task, ToDoListProvider toDoListProvider);
}
