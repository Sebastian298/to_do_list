import 'package:flutter/widgets.dart';
import 'package:to_do_list/domain/entities/task.dart';

class ToDoListProvider extends ChangeNotifier {
  List<Task> tasks = [];
}
