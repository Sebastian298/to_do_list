import 'package:flutter/widgets.dart';
import 'package:to_do_list/domain/entities/task.dart';
import 'package:to_do_list/domain/repositories/to_do_list_repository.dart';

class ToDoListProvider extends ChangeNotifier {
  final ToDoListRepository toDoListRepository;

  List<Task> tasks = [];

  ToDoListProvider({required this.toDoListRepository});

  Future<void> addNewTask(
      String title, String description, String dueDate) async {
    if (title.isEmpty) {
      return;
    }
    final newTask =
        await toDoListRepository.addNewTask(title, description, dueDate);
    tasks.add(newTask);
    notifyListeners();
  }

  Future<void> removeTask(Task task) async {
    await toDoListRepository.removeTask(task, this);
    tasks.remove(task);
    notifyListeners();
  }

  Future<void> updateTask(Task task) async {
    await toDoListRepository.updateTask(task, this);
    //final index = tasks.indexWhere((element) => element == task);
    //tasks[index] = task;
    notifyListeners();
  }

  Future<void> toggleTaskCompletition(Task task) async {
    await toDoListRepository.toggleTaskCompletition(task, this);
    //final index = tasks.indexWhere((element) => element == task);
    //tasks[index].isCompleted = !task.isCompleted;
    notifyListeners();
  }
}
