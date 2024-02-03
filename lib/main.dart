import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/config/theme/app_theme.dart';
import 'package:to_do_list/infrastructure/repositories/to_do_list_repository_impl.dart';
import 'package:to_do_list/presentation/providers/to_do_list_provider.dart';
import 'package:to_do_list/presentation/screens/to_do/to_do_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ToDoListRepositoryImpl toDoListRepository = ToDoListRepositoryImpl();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ToDoListProvider(
            toDoListRepository: toDoListRepository,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'To do List',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 1).theme(),
        home: const ToDoScreen(),
      ),
    );
  }
}
