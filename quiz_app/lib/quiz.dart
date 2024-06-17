import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

// _ means private class
class _QuizState extends State<Quiz> {
  // It can be null as in the start it doesnt have any value
  Widget? activeScreen;

  // Method is called once variables and methods are created
  @override
  void initState() {
    // Screen that user actually see
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 85, 36, 171),
                Color.fromARGB(255, 106, 48, 208),
              ])),
          child: activeScreen,
        ),
      ),
    );
  }
}
