import 'package:to_do_list/domain/datasource/to_do_list_datasource.dart';
import 'package:to_do_list/domain/entities/task.dart';
import 'package:to_do_list/presentation/providers/to_do_list_provider.dart';

class ToDoListDatasourceImpl extends ToDoListDataSource {
  @override
  Future<Task> addNewTask(String title, String description, String dueDate) {
    final newTask = Task(
      title: title,
      createdAt: dueDate,
      description: description,
    );
    return Future.value(newTask);
  }

  @override
  Future<void> removeTask(Task task, ToDoListProvider toDoListProvider) {
    toDoListProvider.tasks.remove(task);
    return Future.value();
  }

  @override
  Future<void> updateTask(Task task, ToDoListProvider toDoListProvider) {
    final index =
        toDoListProvider.tasks.indexWhere((element) => element == task);
    toDoListProvider.tasks[index] = task;
    return Future.value();
  }
}
