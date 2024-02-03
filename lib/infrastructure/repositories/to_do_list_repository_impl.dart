import 'package:to_do_list/domain/entities/task.dart';
import 'package:to_do_list/domain/repositories/to_do_list_repository.dart';

class ToDoListRepositoryImpl extends ToDoListRepository {
  @override
  Future<Task> addNewTask(String title, String description, DateTime dueDate) {
    // TODO: implement addNewTask
    throw UnimplementedError();
  }

  @override
  Future<void> removeTask(Task task) {
    // TODO: implement removeTask
    throw UnimplementedError();
  }

  @override
  Future<void> updateTask(Task task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
