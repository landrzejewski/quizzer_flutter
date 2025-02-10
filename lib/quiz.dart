import 'package:flutter/material.dart';
import 'package:quizzer/data/questions.dart';
import 'package:quizzer/screens/questions_screen.dart';
import 'package:quizzer/screens/summary_screen.dart';
import 'package:quizzer/screens/welcome_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

/*
  Every Flutter Widget has a built-in lifecycle: A collection of methods that are automatically executed by Flutter. 
  There are three extremely important (stateful) widget lifecycle methods you should be aware of:

  initState(): Executed by Flutter when the StatefulWidget's State object is initialized
  build(): Executed by Flutter when the Widget is built for the first time AND after setState() was called
  dispose(): Executed by Flutter right before the Widget will be deleted (e.g., because it was displayed conditionally)
*/

enum Screen { strat, questions, summary }

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = WelcomeScreen(changeScreen);
  //   super.initState();
  // }

  List<String> selectedAnswers = [];
  var activeScreen = Screen.strat;

  void changeScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = Screen.questions;
    });
  }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = Screen.summary;
      });
    }
  }

  void restart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = Screen.questions;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? screen;

    switch (activeScreen) {
      case Screen.strat:
        screen = WelcomeScreen(changeScreen);
        break;
      case Screen.questions:
        screen = QuestionsScreen(onSelectAnswer: selectAnswer);
        break;
      case Screen.summary:
        screen = SummaryScreen(selectedAnswers: selectedAnswers, onRestart: restart);
        break;
    }

    // final screen = activeScreen == 'start'
    //     ? WelcomeScreen(changeScreen)
    //     : QuestionsScreen(onSelectAnswer: selectAnswer);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 224, 220, 228),
              ),
              // child: activeScreen,),
              child: screen)),
    );
  }
}
