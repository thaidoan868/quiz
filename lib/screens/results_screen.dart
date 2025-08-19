import 'package:flutter/material.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/widgets/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  final Questions questions;
  const ResultsScreen({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered ${questions.getTotalCorrectAnswers()} out of ${questions.getLength()} questions correctly"),
            const SizedBox(height: 30),
            QuestionsSummary(questions: questions),
            const SizedBox(height: 30),
            TextButton(onPressed: () {}, child: const Text("Restart Quiz!")),
          ],
        ),
      ),
    );
  }
}
