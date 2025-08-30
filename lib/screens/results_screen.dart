import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/data/database.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/widgets/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  final void Function() nextScreen;
  const ResultsScreen({super.key, required this.nextScreen});

  @override
  Widget build(BuildContext context) {
    final Questions questions = context.select<Database, Questions>(
      (d) => d.questions,
    );

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered ${questions.getTotalCorrectAnswers()} out of ${questions.getLength()} questions correctly",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(questions: questions),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: () {
                questions.resetQuestions();
                nextScreen();
              },
              icon: Icon(Icons.refresh, color: Colors.white, size: 28),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "Restart Quiz!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
