import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/dumy_questions.dart';
import 'package:flutter_quiz_app/screens/home_screen.dart';
import 'package:flutter_quiz_app/screens/question_screen.dart';
import 'package:flutter_quiz_app/screens/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "home-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void reStartQuiz() {
    setState(() {
    selectedAnswers = [];
    activeScreen = "home-screen";
    });
  }

  void choosenAnswer(String answerText) {
    selectedAnswers.add(answerText);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedWidget = HomeScreen(switchScreen);

    if (activeScreen == "question-screen") {
      selectedWidget = QuestionScreen(onSelectedAnswer: choosenAnswer);
    }

    if (activeScreen == "result-screen") {
      selectedWidget = ResultScreen(
          selectedAnswerList: selectedAnswers, onRestart: reStartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 148, 18, 171),
                Color.fromARGB(255, 80, 3, 94),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: selectedWidget,
        ),
      ),
    );
  }
}
