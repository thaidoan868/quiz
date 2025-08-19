import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/models/answer.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  final Questions questions;
  final void Function() nextScreen;
  QuestionsScreen({super.key, required this.questions, required this.nextScreen})
    : assert(
        questions.getLength() > 0,
        "Questions can not be empty. Questions screen need some questions to display.",
      );

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late Questions questions;
  late void Function() nextScreen;
  int currentQuestionIndex = 0;
  List<Answer> selectedAnswers = [];

  void answerQuestion(Question question, Answer answer) {
    question.selectedAnswer = answer;
    if (currentQuestionIndex + 1 < questions.getLength()) {
      setState(() {
        currentQuestionIndex++;
      });
    } else if (currentQuestionIndex + 1 == questions.getLength()) {
      nextScreen();
    }
  }

  @override
  void initState() {
    super.initState();
    questions = widget.questions;
    nextScreen = widget.nextScreen;
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions.questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(170, 255, 255, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: AnswerButton(
                  answer: answer.answer,
                  onPressed: () => answerQuestion(currentQuestion, answer),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
