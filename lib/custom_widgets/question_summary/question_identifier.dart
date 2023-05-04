import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/custom_widgets/styled_text.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.questionIndex, required this.isCorrectAnswer});

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ((isCorrectAnswer) ? Colors.green : Colors.pink),
      child: StyledText(
        text: questionIndex.toString(),
        size: 14,
        alignment: TextAlign.left,
      ),
    );
  }
}
