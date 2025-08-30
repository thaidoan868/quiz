import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/models/questions.dart';

class Database extends ChangeNotifier {
  Database._(this._box);

  static Database? _instance;
  static Database get I => _instance!;

  static const _boxName = 'quizBox';
  static const _questionsKey = 'questions';

  final Box _box;
  Questions _questions = Questions.empty();
  Questions get questions => _questions;

  /// Call once at startup (after Hive.initFlutter + adapter registration)
  static Future<void> init() async {
    final box = await Hive.openBox(_boxName);
    final db = Database._(box);

    // set default values for questions
    if (!box.containsKey(_questionsKey)) {
      db.setQuestions(defaultQuestions);
    } else {
      db._questions = box.get(_questionsKey) as Questions;
    }

    _instance = db;
  }

  Future<void> setQuestions(Questions value) async {
    _questions = value;
    await _box.put(_questionsKey, value);
    notifyListeners();
  }

  Future<void> save() async {
    await _box.put(_questionsKey, _questions);
    notifyListeners();
  }
}