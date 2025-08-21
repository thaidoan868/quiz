import 'package:quiz/models/answer.dart';

class Question {
  // required
  // getters only
  final String _question;
  final List<Answer> _answers;

  // can't be set by constructor
  // getter and setter with conditions
  Answer? _selectedAnswer;

  String get question => _question;

  List get answers => List.unmodifiable(_answers);

  Answer? get selectedAnswer => _selectedAnswer;

  set selectedAnswer(Answer? answer) {
    if (_answers.contains(answer)) {
      _selectedAnswer = answer;
    } else if (answer == null) {
      return _selectedAnswer = null;
    } else {
      throw ArgumentError(
        "The selected answer must be one of the provided answers.",
      );
    }
  }

  Question({required String question, required List<Answer> answers})
    : _question = question,
      _answers = answers;

  List<Answer> getShuffledAnswers() {
    final List<Answer> shuffledAnswers = List.of(_answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }

  Answer? getCorrectAnswer() {
    for (Answer answer in answers) {
      if (answer.isCorrect) {
        return answer;
      }
    }
    return null;
  }

  bool answeredCorrectly() {
    if (getCorrectAnswer() == _selectedAnswer) {
      return true;
    }
    return false;
  }

  void clear() {
    selectedAnswer = null;
  }
}
