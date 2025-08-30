import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quiz/data/database.dart';
import 'package:quiz/models/answer.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/quiz.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(AnswerAdapter());
  Hive.registerAdapter(QuestionAdapter());
  Hive.registerAdapter(QuestionsAdapter());

  // Open boxes you need before runApp
  await Hive.openBox('quizBox');

  await Database.init(); // creates the singleton & loads data

  runApp(
    ChangeNotifierProvider<Database>.value(
      value: Database.I,
      child: Quiz(),
    ),
  );
}
