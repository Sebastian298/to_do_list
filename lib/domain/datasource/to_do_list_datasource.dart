import 'package:to_do_list/domain/entities/task.dart';

abstract class ToDoListDataSource {
  Future<List<Task>> getTasks();
  Future<void> addNewTask(Task task);
  Future<void> removeTask(Task task);
  Future<void> updateTask(Task task);
}
