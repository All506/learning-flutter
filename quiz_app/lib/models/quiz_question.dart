class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffleAnswers() {
    // Stores copy and shuffles it
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
