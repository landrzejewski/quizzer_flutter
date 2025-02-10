class QuizQuestion {
  const QuizQuestion(this.text, this.answers, this.validAnswer);

  final String text;
  final List<String> answers;
  final int validAnswer;

  List<String> get shuffledAnswers {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
