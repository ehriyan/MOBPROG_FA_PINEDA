class Quiz {
  const Quiz(this.question, this.choice, this.correctAnswer);

  final String question;
  final List<String> choice;
  final String correctAnswer;

  List<String> getShuffledList() {
    final shuffledList = List<String>.from(choice);
    shuffledList.shuffle();
    return shuffledList;
  }
}
