import 'package:flutter/material.dart';
import 'package:quizzer/data/questions.dart';
import 'package:quizzer/widgets/questions_summary.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({
    super.key,
    required this.selectedAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> selectedAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> data = [];
    for (var index = 0; index < selectedAnswers.length; index++) {
      final question = questions[index];
      data.add({
        'index': index,
        'question': question.text,
        'validAnswer': question.answers[question.validAnswer],
        'selectedAnswer': selectedAnswers[index]
      });
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Color.fromARGB(220, 94, 10, 119);
    final totalQuestionsCount = questions.length;
    final correctQuestionsCount = summaryData
        .where((data) => data['validAnswer'] == data['selectedAnswer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Correct answers \n$correctQuestionsCount out of $totalQuestionsCount',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 28),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: onRestart,
              child: const Text('Restart', style: TextStyle(fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}
