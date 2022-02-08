import 'package:flutter/material.dart';
import 'package:lesson_6_3_tasks/pages/home_page.dart';
import 'package:lesson_6_3_tasks/pages/task_1.dart';
import 'package:lesson_6_3_tasks/pages/task_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Task1Page(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        Task1Page.id: (context) => const Task1Page(),
        Task2Page.id: (context) => const Task2Page()
      },
    );
  }
}