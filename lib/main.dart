import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'home_page.dart';

void main() async {
  await Hive.initFlutter('to_do_app_flutter_tutorial_hive_local_storage_by_mitch_koko');

  // ignore: unused_local_variable
  var box = await Hive.openBox('my_task_box');

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO DO App • Flutter Tutorial Hive Local Storage By Mitch Koko',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.yellow,
          seedColor: Colors.yellow,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
