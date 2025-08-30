import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz/models/answer.dart';

part 'question.g.dart';

@HiveType(typeId: 1)
class Question {
  // Required fields
  @HiveField(0)
  final String question;

  @HiveField(1)
  final List<Answer> answers;

  // Field that can be updated
  @HiveField(2)
  Answer? selectedAnswer;

  Question({required this.question, required this.answers});

  // Returns a shuffled list of answers
  List<Answer> getShuffledAnswers() {
    final List<Answer> shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }

  // Returns the correct answer if present
  Answer? getCorrectAnswer() {
    for (Answer answer in answers) {
      if (answer.isCorrect) {
        return answer;
      }
    }
    return null;
  }

  // Checks if the selected answer is correct
  bool answeredCorrectly() {
    return getCorrectAnswer() == selectedAnswer;
  }

  // Clears the selected answer
  void clear() {
    selectedAnswer = null;
  }
}
