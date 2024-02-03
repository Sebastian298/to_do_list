import 'package:flutter/material.dart';
import 'package:to_do_list/config/router/app_router.dart';
import 'package:to_do_list/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'To do List',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).theme(),
    );
  }
}
