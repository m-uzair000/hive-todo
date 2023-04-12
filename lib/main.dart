import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_todo/home.dart';
import 'package:hive_todo/todo_model.dart';

/// Global Variable
late Box box;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }

}

Future initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  box = await Hive.openBox<TodoModel>('todoHive');
}
