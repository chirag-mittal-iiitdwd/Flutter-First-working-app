import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onPressedAnswerToQuestion;
  final String option;
  Answer({this.option, this.onPressedAnswerToQuestion});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        // The value of on pressed is a function that returns void
        // Never add this function outside this class
        // when we use onPressedQuestion() than this returns the output of the function, instead if we use onPressedQuestion
        // without () than we simply are passing the pointer to the function.
        // What happens is that this function and the text and everything is just placed on to the screen and waits for any input from the user
        // It's like food is there on bufet for us to choose what to eat
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: onPressedAnswerToQuestion,
        child: Text(option),
      ),
    );
  }
}
