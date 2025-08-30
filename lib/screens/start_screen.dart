import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/quiz.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz Game'),
        centerTitle: true,
        backgroundColor: Colors.purple[700],
        elevation: 0,
        foregroundColor: Colors.white, // white back arrow
      ),
      body: Container(
        decoration: gradientDecoration,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/quiz-logo.png",
                width: 300,
                color: const Color.fromARGB(188, 255, 255, 255),
              ),
              const SizedBox(height: 80),
              const Text(
                'Learn flutter the fun way',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                onPressed: () {
                  context.push("/questions");
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white),
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text("Start Quiz"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
