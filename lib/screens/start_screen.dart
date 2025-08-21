import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() nextScreen;
  const StartScreen({required this.nextScreen, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
              nextScreen();
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
    );
  }
}
