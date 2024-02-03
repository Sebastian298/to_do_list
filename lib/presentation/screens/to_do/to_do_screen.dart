import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/domain/entities/task.dart';
import 'package:to_do_list/presentation/providers/to_do_list_provider.dart';
import 'package:to_do_list/presentation/widgets/shared/confirm_dialog.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final toDoListProvider = context.watch<ToDoListProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 13,
            ),
            Expanded(
              child: ListView.builder(
                controller: toDoListProvider.scrollController,
                itemCount: toDoListProvider.tasks.length,
                itemBuilder: (context, index) {
                  final task = toDoListProvider.tasks[index];
                  return _ListTileScreen(
                    task: task,
                    onTapCallback: () {
                      toDoListProvider.toggleTaskCompletition(task);
                    },
                    onDeleteCallback: () {
                      toDoListProvider.removeTask(task);
                    },
                    onEditCallback: () {},
                  );
                },
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                _showAddTaskDialog(context, toDoListProvider.addNewTask);
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      )),
    );
  }
}

void _showAddTaskDialog(
  BuildContext context,
  Function(String, String, String) addNewTaskFunction,
) {
  String title = '';
  String description = '';
  final String createdAt =
      DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add Task'), // Título del AlertDialog
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (value) {
                title =
                    value; // Actualizar el valor del título al cambiar el texto
              },
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              onChanged: (value) {
                description =
                    value; // Actualizar el valor de la descripción al cambiar el texto
              },
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              addNewTaskFunction(title, description, createdAt);
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el AlertDialog
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}

class _ListTileScreen extends StatelessWidget {
  final Task task;
  final VoidCallback onTapCallback;
  final VoidCallback onDeleteCallback;
  final VoidCallback onEditCallback;

  const _ListTileScreen({
    required this.task,
    required this.onTapCallback,
    required this.onDeleteCallback,
    required this.onEditCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: task.isCompleted
          ? Colors.green[300]
          : Theme.of(context).colorScheme.surfaceVariant,
      child: Column(children: [
        _LisTileStruct(
          task: task,
          onTapCallback: onTapCallback,
          onDeleteCallback: onDeleteCallback,
          onEditCallback: onEditCallback,
        ),
        const SizedBox(
          height: 7,
        ),
      ]),
    );
  }
}

class _LisTileStruct extends StatelessWidget {
  final Task task;
  final VoidCallback onTapCallback;
  final VoidCallback onDeleteCallback;
  final VoidCallback onEditCallback;

  const _LisTileStruct({
    required this.task,
    required this.onTapCallback,
    required this.onDeleteCallback,
    required this.onEditCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTapCallback,
      title: Text(
        task.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: _SubTitleStruct(
        description: task.description,
        date: task.createdAt,
        isCompleted: task.isCompleted,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      leading: _TaskStatusIcon(
        hasCompletedTask: task.isCompleted,
      ),
      trailing: _TrailingStruct(
        onDeleteCallback: onDeleteCallback,
      ),
    );
  }
}

class _TaskStatusIcon extends StatelessWidget {
  final bool hasCompletedTask;
  const _TaskStatusIcon({
    required this.hasCompletedTask,
  });

  @override
  Widget build(BuildContext context) {
    final IconData icon = hasCompletedTask
        ? Icons.radio_button_checked
        : Icons.radio_button_unchecked;
    return Icon(
      icon,
      color: Colors.blue,
    );
  }
}

class _SubTitleStruct extends StatelessWidget {
  final String description;
  final String date;
  final bool isCompleted;
  const _SubTitleStruct({
    required this.description,
    required this.date,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            decoration: isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          date,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _TrailingStruct extends StatelessWidget {
  final VoidCallback onDeleteCallback;
  const _TrailingStruct({
    required this.onDeleteCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 10,
        ),
        ConfirmDialog(
          title: 'Delete Task',
          description: 'Are you sure you want to delete this task?',
          onConfirm: onDeleteCallback,
          // ignore: prefer_const_constructors
          iconDialog: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          dialogType: DialogType.warning,
        ),
      ],
    );
  }
}
