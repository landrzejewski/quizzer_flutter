import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzer/widgets/answer_button.dart';
import 'package:quizzer/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionIndex = 0;

  void answerQuestion(String selectdAnswer) {
    widget.onSelectAnswer(selectdAnswer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(context) {
    final question = questions[questionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Color.fromARGB(220, 94, 10, 119),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              // style: TextStyle(
              //     color: Color.fromARGB(220, 94, 10, 119), fontSize: 32),
            ),
            const SizedBox(height: 30),
            ...question.shuffledAnswers.map((answer) => AnswerButton(
                answerText: answer, onTap: () => answerQuestion(answer)))
          ],
        ),
      ),
    );
  }
}
