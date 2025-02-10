import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzer/widgets/summary_number.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['selectedAnswer'] == itemData['validAnswer'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SummaryNumber(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['index'] as int,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.roboto(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(itemData['selectedAnswer'] as String,
                    style: GoogleFonts.roboto(
                      color: isCorrectAnswer
                          ? const Color.fromARGB(255, 85, 151, 131)
                          : const Color.fromARGB(255, 179, 87, 87),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
