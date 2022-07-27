import 'package:flutter/material.dart';
import 'package:flutter_task/utils/routes.dart';
import 'package:flutter_task/view/screens/categories/categories.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Task',
        themeMode: ThemeMode.light,
        onGenerateRoute: Routes.generateRoute,
        home: Categories());
  }
}
