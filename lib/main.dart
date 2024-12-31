import 'calendar.dart';

import 'exercise.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Wrap with MaterialApp
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Fitness Time'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.person)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: ExerciseLog(),
              ),
              Center(
                child: ExerciseCalendar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
