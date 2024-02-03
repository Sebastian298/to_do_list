import 'package:to_do_list/domain/entities/task.dart';
import 'package:to_do_list/domain/repositories/to_do_list_repository.dart';
import 'package:to_do_list/infrastructure/datasources/to_do_list_datasource_impl.dart';
import 'package:to_do_list/presentation/providers/to_do_list_provider.dart';

class ToDoListRepositoryImpl extends ToDoListRepository {
  @override
  Future<Task> addNewTask(String title, String description, String dueDate) {
    return ToDoListDatasourceImpl().addNewTask(title, description, dueDate);
  }

  @override
  Future<void> removeTask(Task task, ToDoListProvider toDoListProvider) {
    return ToDoListDatasourceImpl().removeTask(task, toDoListProvider);
  }

  @override
  Future<void> updateTask(Task task, ToDoListProvider toDoListProvider) {
    return ToDoListDatasourceImpl().updateTask(task, toDoListProvider);
  }

  @override
  Future<void> toggleTaskCompletition(
      Task task, ToDoListProvider toDoListProvider) {
    return ToDoListDatasourceImpl()
        .toggleTaskCompletition(task, toDoListProvider);
  }
}
