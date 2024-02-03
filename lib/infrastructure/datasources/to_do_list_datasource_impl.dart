import 'package:to_do_list/domain/datasource/to_do_list_datasource.dart';
import 'package:to_do_list/domain/entities/task.dart';
import 'package:to_do_list/presentation/providers/to_do_list_provider.dart';

class ToDoListDatasourceImpl extends ToDoListDataSource {
  final ToDoListProvider toDoListProvider;

  ToDoListDatasourceImpl({required this.toDoListProvider});
  @override
  Future<Task> addNewTask(String title, String description, DateTime dueDate) {
    if (title.isEmpty) {
      return Future.error('Title cannot be empty');
    }
    final newTask = Task(
      title: title,
      createdAt: dueDate,
      description: description,
    );
    toDoListProvider.tasks.add(newTask);
    return Future.value(newTask);
  }

  @override
  Future<void> removeTask(Task task) {
    toDoListProvider.tasks.remove(task);
    return Future.value();
  }

  @override
  Future<void> updateTask(Task task) {
    final index =
        toDoListProvider.tasks.indexWhere((element) => element == task);
    toDoListProvider.tasks[index] = task;
    return Future.value();
  }
}
