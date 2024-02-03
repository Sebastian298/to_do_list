import 'package:flutter/widgets.dart';
import 'package:to_do_list/domain/entities/task.dart';
import 'package:to_do_list/domain/repositories/to_do_list_repository.dart';

class ToDoListProvider extends ChangeNotifier {
  final scrollController = ScrollController();
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
    moveScrollToBottom();
  }

  Future<void> removeTask(Task task) async {
    await toDoListRepository.removeTask(task, this);
    notifyListeners();
  }

  Future<void> updateTask(Task task) async {
    await toDoListRepository.updateTask(task, this);
    notifyListeners();
  }

  Future<void> toggleTaskCompletition(Task task) async {
    await toDoListRepository.toggleTaskCompletition(task, this);
    notifyListeners();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
