import 'package:hive/hive.dart';
part 'answer.g.dart';

@HiveType(typeId: 0)
class Answer {
  @HiveField(0)
  final bool isCorrect;

  @HiveField(1)
  final String answer;

  const Answer({required this.isCorrect, required this.answer});
}
