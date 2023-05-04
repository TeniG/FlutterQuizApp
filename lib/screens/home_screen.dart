import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/custom_widgets/styled_text.dart';
import 'package:flutter_quiz_app/custom_widgets/styled_outlined_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const StyledText(
            text: "Learn Flutter the fun way!",
            size: 20,
          ),
          const SizedBox(
            height: 30,
          ),
          StyledOutlinedButton(startQuiz, text: "Start Quiz"),
        ],
      ),
    );
  }
}
