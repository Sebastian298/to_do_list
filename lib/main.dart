import 'package:flutter/material.dart';
import 'package:to_do_list/config/theme/app_theme.dart';
import 'package:to_do_list/presentation/screens/to_do/to_do_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To do List',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).theme(),
      home: const ToDoScreen(),
    );
  }
}
