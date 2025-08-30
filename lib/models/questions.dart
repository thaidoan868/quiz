import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz/models/answer.dart';
import 'package:quiz/models/question.dart';
part 'questions.g.dart';

@HiveType(typeId: 2)
class Questions {
  @HiveField(0)
  List<Question> questions = [];

  Questions(this.questions);

  Questions.empty();

  void addQuestion(Question question) => questions.add(question);

  int getTotalQuestions() {
    return questions.length;
  }

  int getLength() {
    return questions.length;
  }

  int getTotalCorrectAnswers() {
    int numCorrectAnswers = 0;
    for (Question question in questions) {
      Answer? answer = question.selectedAnswer;
      if (answer == question.getCorrectAnswer()) {
        numCorrectAnswers++;
      }
    }
    return numCorrectAnswers;
  }

  void resetQuestions() {
    for (Question question in questions) {
      question.clear();
    }
  }
}
