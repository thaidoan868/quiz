import 'package:quiz/models/answer.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/models/questions.dart';

List<Question> questionsList = [
  Question(
    question: "What is Flutter?",
    answers: [
      Answer(
        isCorrect: true,
        answer:
            "An open-source UI toolkit by Google for building cross-platform apps",
      ),
      Answer(isCorrect: false, answer: "A backend framework for databases"),
      Answer(isCorrect: false, answer: "A package manager for Dart"),
      Answer(
        isCorrect: false,
        answer: "A cloud hosting service for mobile apps",
      ),
    ],
  ),
  Question(
    question: "Which programming language is primarily used with Flutter?",
    answers: [
      Answer(isCorrect: false, answer: "Java"),
      Answer(isCorrect: false, answer: "Kotlin"),
      Answer(isCorrect: true, answer: "Dart"),
      Answer(isCorrect: false, answer: "Swift"),
    ],
  ),
  Question(
    question: "What is the role of a Widget in Flutter?",
    answers: [
      Answer(
        isCorrect: true,
        answer: "It is the basic building block of a Flutter UI",
      ),
      Answer(
        isCorrect: false,
        answer: "It stores only the business logic of the app",
      ),
      Answer(
        isCorrect: false,
        answer: "It manages only the database connections",
      ),
      Answer(isCorrect: false, answer: "It is used only for state management"),
    ],
  ),
  Question(
    question: "What is the purpose of the hot reload feature in Flutter?",
    answers: [
      Answer(
        isCorrect: false,
        answer: "To restart the app completely every time a change is made",
      ),
      Answer(
        isCorrect: true,
        answer:
            "To update the UI instantly without losing the current app state",
      ),
      Answer(
        isCorrect: false,
        answer: "To compile the app into native code for release",
      ),
      Answer(
        isCorrect: false,
        answer: "To automatically fix syntax errors in the code",
      ),
    ],
  ),
];

Questions questions = Questions(questionsList);
