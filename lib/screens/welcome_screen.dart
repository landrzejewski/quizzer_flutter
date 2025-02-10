import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  final textColor = Color.fromARGB(220, 94, 10, 119);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 300,
          color: textColor,
        ),
        // Opacity(
        //   opacity: 0.4,
        //   child: Image.asset(
        //     'assets/images/logo.png',
        //     width: 300,
        //   ),
        // ),
        const SizedBox(height: 32),
        Text(
          "Test your knowledge!",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 32),
        ),
        const SizedBox(height: 32),
        // OutlinedButton(
        //   onPressed: () {},
        //   style: OutlinedButton.styleFrom(foregroundColor: textColor),
        //   child: Text("Start quiz"),
        // )
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(foregroundColor: textColor),
          iconAlignment: IconAlignment.end,
          icon: Icon(Icons.east),
          label: Text("Start quiz", style: TextStyle(fontSize: 20)),
        )
      ],
    ));
  }
}
