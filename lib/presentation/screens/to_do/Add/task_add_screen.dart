import 'package:flutter/material.dart';

class TaskAddScreen extends StatelessWidget {
  const TaskAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 13,
              ),
              _TextFieldScreen(labelText: 'Title'),
              SizedBox(
                height: 13,
              ),
              _TextFieldScreen(labelText: 'Description'),
              SizedBox(
                height: 13,
              ),
              _ButtonScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextFieldScreen extends StatelessWidget {
  final String labelText;
  const _TextFieldScreen({required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}

class _ButtonScreen extends StatelessWidget {
  const _ButtonScreen();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Add'),
    );
  }
}
