import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/actual_questions.dart';
import 'package:quiz_app/styled_button.dart';

class QuestionsScreens extends StatefulWidget {
  const QuestionsScreens(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreens> createState() {
    return _QuestionsScreensState();
  }
}

class _QuestionsScreensState extends State<QuestionsScreens> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {

    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = question[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questionText,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((ans) {
              return StyledButton(
                ans,
                () {
                  answerQuestion(ans);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
