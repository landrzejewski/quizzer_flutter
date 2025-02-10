import 'package:flutter/material.dart';
import 'package:quizzer/widgets/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.data, {super.key});

  final List<Map<String, Object>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: data
              .map((row) => SummaryItem(row))
              .toList(),
        ),
      ),
    );
  }
}
