import 'package:flutter/material.dart';
import 'package:quiz/models/questions.dart';

class QuestionsSummary extends StatelessWidget {
  final Questions questions;
  const QuestionsSummary({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    var greenColor = Color.fromARGB(255, 127, 234, 182);
    var redColor = Colors.red[400];
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: questions.questions.asMap().entries.map((entry) {
            final index = entry.key + 1;
            final question = entry.value;
            return (Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: question.answeredCorrectly()
                            ? greenColor
                            : redColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        index.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: Colors.purple[700],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            question.question,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: question.answeredCorrectly()
                                  ? greenColor
                                  : redColor,
                            ),
                          ),
                          const SizedBox(height: 5),
                          question.answeredCorrectly()
                              ? SizedBox.shrink()
                              : Text(
                                  "Your answer: ${question.selectedAnswer?.answer ?? 'Not selected'}",
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: redColor,
                                    color: redColor,
                                  ),
                                ),
                          Text(
                            "${question.answeredCorrectly() ? "You answered correctly" : "Correct answer"}: ${question.getCorrectAnswer()?.answer ?? 'This question has no correct answer'}",
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ));
          }).toList(),
        ),
      ),
    );
  }
}
