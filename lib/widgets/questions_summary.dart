import 'package:flutter/material.dart';
import 'package:quiz/models/questions.dart';

class QuestionsSummary extends StatelessWidget {
  final Questions questions;
  const QuestionsSummary({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        child: Column(
          children: questions.questions.asMap().entries.map((entry) {
            final index = entry.key;
            final question = entry.value;
            return (Row(
              children: [
                Text((index + 1).toString()),
                Expanded(
                  child: Column(
                    children: [
                      Text(question.question),
                      const SizedBox(height: 5),
                      Text(
                        "Your answer: ${question.selectedAnswer?.answer ?? 'Not selected'}",
                      ),
                      Text(
                        "Correct answer: ${question.getCorrectAnswer()?.answer ?? 'This question has no correct answer'}",
                      ),
                    ],
                  ),
                ),
              ],
            ));
          }).toList(),
        ),
      ),
    );
  }
}
