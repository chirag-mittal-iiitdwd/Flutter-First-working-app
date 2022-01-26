import "package:flutter/material.dart";

// This is a stateless widget and is changes whenever we make a new call to it
class Question extends StatelessWidget {
  // When the constructor is called then it's ok but it will change again
  final String currentQuestion;
  Question(this.currentQuestion);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(40), // 40 device pixels
      child: Text(
        currentQuestion,
        style: TextStyle(
          fontSize: 28,
        ),
        // This centre thing works on enum, which is set of values, it is basically label added to a value
        textAlign: TextAlign.center,
      )
    );
  }
}
