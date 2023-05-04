import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/custom_widgets/answer_button.dart';
import 'package:flutter_quiz_app/custom_widgets/styled_text.dart';
import 'package:flutter_quiz_app/data/dumy_questions.dart';
import 'package:flutter_quiz_app/models/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswer});

  final void Function(String selectedAnswer) onSelectedAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    void answeredButtonTapped(String selectedAnswer) {
      //To access the Widget class method we use "widget.methodName"
      widget.onSelectedAnswer(selectedAnswer);
      setState(() {
        currentQuestionIndex++;
      });
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(
              text: currentQuestion.questionText,
              size:20,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.ShuffledAnswerList.map( // ShuffledAnswerList is getter method used as property 
                  (answer) => AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answeredButtonTapped(answer);
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
