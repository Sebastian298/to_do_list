import 'package:to_do_list/domain/entities/task.dart';

abstract class ToDoListRepository {
  Future<List<Task>> getTasks();
  Future<Task> addNewTask(Task task);
  Future<void> removeTask(Task task);
  Future<void> updateTask(Task task);
}
