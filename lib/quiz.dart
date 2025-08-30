import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/data/database.dart';
import 'package:quiz/screens/questions_screen.dart';
import 'package:quiz/screens/results_screen.dart';
import 'package:quiz/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String screen = "start";
  late Widget activeScreen;
  late final Map<String, Widget> screens;

  void setScreen(String screen) {
    setState(() {
      this.screen = screen;
    });
  }

  @override
  void initState() {
    super.initState();
    screens = {
      "start": StartScreen(nextScreen: () => setScreen("questions")),
      "questions": QuestionsScreen(
        nextScreen: () => setScreen("results"),
      ),
      "results": ResultsScreen(
        nextScreen: () => setScreen("start"),
      ),
    };
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    activeScreen = screens[screen] ?? const SizedBox();
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.shade400, Colors.purple.shade800],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
