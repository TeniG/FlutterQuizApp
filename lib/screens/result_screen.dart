import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/custom_widgets/question_summary/questions_summary.dart';
import 'package:flutter_quiz_app/custom_widgets/styled_text.dart';
import 'package:flutter_quiz_app/custom_widgets/styled_outlined_button.dart';
import 'package:flutter_quiz_app/data/dumy_questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.selectedAnswerList, required this.onRestart});

  final List<String> selectedAnswerList;
  final void Function() onRestart;

// getter method made as property accessible
  List<Map<String, Object>> get SummaryData {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < questions.length; i++) {
      summaryData.add({
        'question_index': i,
        'question_text': questions[i].questionText,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswerList[i]
      });
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = SummaryData.where((element) {
      return (element['user_answer'] == element['correct_answer']);
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(
              text:
                  "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
              size: 20,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(SummaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              label: const Text("Restart Quiz"),
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
