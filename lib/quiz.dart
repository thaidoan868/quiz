import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz/screens/questions_screen.dart';
import 'package:quiz/screens/results_screen.dart';
import 'package:quiz/screens/start_screen.dart';

class Quiz extends StatelessWidget {
  Quiz({super.key});

  @override
  void dispose() {
    Hive.close();
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const StartScreen(),
      ),
      GoRoute(
        path: '/questions',
        builder: (context, state) => const QuestionsScreen(),
      ),
      GoRoute(
        path: '/results',
        builder: (context, state) => const ResultsScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router, // Use go_router instead of navigator
    );
  }
}

final gradientDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [Colors.purple.shade400, Colors.purple.shade800],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);
