import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/custom_widgets/question_summary/question_identifier.dart';
import 'package:flutter_quiz_app/custom_widgets/styled_text.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});
  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    int questionIndex = (itemData['question_index'] as int) + 1;
    return Row(
      children: [
        QuestionIdentifier(
            questionIndex: questionIndex, isCorrectAnswer: isCorrectAnswer),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question_text'] as String,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: StyledText(
                        text: "${itemData['user_answer'] as String}",
                        size: 18,
                        color: const Color.fromARGB(255, 244, 162, 170),
                        alignment: TextAlign.left,
                      ),
                    ),
                    (isCorrectAnswer)? const Icon(
                      Icons.check_outlined,
                      color: Colors.green,
                    ): const Icon(
                      Icons.close,
                      color: Colors.pink,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "${itemData['correct_answer'] as String}",
                  style: GoogleFonts.roboto(
                    color: Color.fromARGB(255, 182, 244, 197),
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
