import 'package:to_do_list/domain/entities/task.dart';
import 'package:to_do_list/domain/repositories/to_do_list_repository.dart';
import 'package:to_do_list/presentation/providers/to_do_list_provider.dart';

class ToDoListRepositoryImpl extends ToDoListRepository {
  @override
  Future<Task> addNewTask(String title, String description, String dueDate) {
    return ToDoListRepositoryImpl().addNewTask(title, description, dueDate);
  }

  @override
  Future<void> removeTask(Task task, ToDoListProvider toDoListProvider) {
    return ToDoListRepositoryImpl().removeTask(task, toDoListProvider);
  }

  @override
  Future<void> updateTask(Task task, ToDoListProvider toDoListProvider) {
    return ToDoListRepositoryImpl().updateTask(task, toDoListProvider);
  }
}
