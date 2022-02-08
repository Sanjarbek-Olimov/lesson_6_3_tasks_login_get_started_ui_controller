import 'package:flutter/material.dart';
import 'package:lesson_6_3_tasks/pages/task_1.dart';
import 'package:lesson_6_3_tasks/pages/task_2.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("HOME", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
      ),
    );
  }
}
