import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz/data/database.dart';
import 'package:quiz/models/answer.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  final VoidCallback nextScreen;
  const QuestionsScreen({super.key, required this.nextScreen});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late final Database db; // ① capture once
  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    db = context.read<Database>(); // one-time fetch; no rebuilds from this
  }

  void _advanceIfAny() {
    final last = currentIndex + 1 == db.questions.getLength();
    if (last) {
      widget.nextScreen();
    } else {
      setState(() => currentIndex++);
    }
  }

  Future<void> _answer(Question q, Answer a) async {
    q.selectedAnswer = a;
    await db.save(); // persist once here
    _advanceIfAny();
  }

  void _skip() => _advanceIfAny();

  @override
  Widget build(BuildContext context) {
    // ② only rebuild when the Questions object changes
    // final db = context.watch<Database>();
    final questions = context.select<Database, Questions>((db) => db.questions);

    if (questions.getLength() == 0) {
      return const Center(child: Text('No questions available'));
    }

    final current = questions.questions[currentIndex];

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "[${currentIndex + 1}/${questions.getLength()}] ${current.question}",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(170, 255, 255, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...current.getShuffledAnswers().map(
              (a) => Padding(
                padding: const EdgeInsets.only(top: 15),
                child: AnswerButton(
                  answer: a.answer,
                  onPressed: () => _answer(current, a),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: TextButton.icon(
                onPressed: () => _skip(),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                label: const Text("Skip"),
                icon: const Icon(Icons.skip_next),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
