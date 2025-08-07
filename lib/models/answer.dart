class Answer {
  // required
  // getters only
  final bool _isCorrect;
  final String _answer;

  bool get isCorrect => _isCorrect;

  String get answer => _answer;

  const Answer({required bool isCorrect, required String answer})
    : _isCorrect = isCorrect,
      _answer = answer;
}
