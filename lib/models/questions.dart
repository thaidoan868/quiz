import 'package:quiz/models/answer.dart';
import 'package:quiz/models/question.dart';

class Questions {
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
      if (answer != null && answer == question.getCorrectAnswer()) {
        numCorrectAnswers++;
      }
    }
    return numCorrectAnswers;
  }
}
