class QuizQuestion {
  const QuizQuestion(this.questionText, this.answers);

  final String questionText;
  final List<String> answers;

   List<String> get ShuffledAnswerList {
    var shuffledList = List.of(answers); //copy list using .of()
    shuffledList.shuffle(); // shuffled the original list hence created the copy of list first
    return shuffledList;
   }
}
