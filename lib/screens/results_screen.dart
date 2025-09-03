import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz/data/database.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/widgets/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Questions questions = context.select<Database, Questions>(
      (d) => d.questions,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
        centerTitle: true,
        backgroundColor: Colors.purple[700],
        elevation: 0,
        foregroundColor: Colors.white, // white back arrow
      ),
      body: Container(
        decoration: gradientDecoration,
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
                  context.go("/");
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
      ),
    );
  }
}
