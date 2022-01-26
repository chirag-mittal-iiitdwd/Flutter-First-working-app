import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function onPressedAnswerToQuestion;
  final List<Map<String, Object>> questions;
  final int currentQuestion;
  Quiz(
      {@required this.onPressedAnswerToQuestion,
      @required this.currentQuestion,
      @required this.questions});
  @override
  Widget build(BuildContext context) {
    return Column(
      // List of widgets
      children: <Widget>[
        Question(questions[currentQuestion]['questionText']),

        // Spread Opeerator in DART
        ...(questions[currentQuestion]['answers'] as List<Map<String,Object>>)
            .map((answer) {
          return Answer(
              onPressedAnswerToQuestion: ()=>onPressedAnswerToQuestion(answer['score']),
              option: answer['text']);
        }).toList()
      ],
    );
  }
}
