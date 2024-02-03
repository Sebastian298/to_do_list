import 'package:go_router/go_router.dart';
import 'package:to_do_list/presentation/screens/to_do/Add/task_add_screen.dart';
import 'package:to_do_list/presentation/screens/to_do/to_do_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ToDoScreen(),
    ),
    GoRoute(
      path: '/addTask',
      builder: (context, state) => const TaskAddScreen(),
    ),
  ],
);
