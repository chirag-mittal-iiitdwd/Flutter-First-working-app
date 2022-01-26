import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final totalScore;
  final VoidCallback resetState;
  Result({@required this.totalScore, @required this.resetState});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("You answered $totalScore out of 3 question correct",
            style: TextStyle(fontSize: 25,color: Colors.black),
          ),
          ElevatedButton(
            onPressed: resetState,
            child: Text("Reset The Quiz"),
          ),
        ],
      ),
    );
  }
}
