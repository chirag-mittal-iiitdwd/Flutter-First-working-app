import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';
import './quiz.dart';

// Main function is executed when app launches
// void main() {
//   // By Flutter, used to run the app, takes the widget tree and puts on screen
//   // It expects the object of the widget tree
//   // The runs the build method in the widget tree
//   runApp(MyApp());
// }

// Shorthand method for functions with only one argument
void main() => runApp(MyApp());

// When external data changes this class is recreated
class MyApp extends StatefulWidget {
  @override
  // Returns a state object which is connected to statefulWidget
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// With this biuld method is inside State
// State is persistent and is attached to element in UI but is not recreated
// any class should have build method
// for stateless -> This Class can't hav state, some widgets should not be changed so hard coded
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s the capital of India?',
      'answers': [
        {'text': 'Delhi', 'score': 1},
        {'text': 'Bangalore', 'score': 0},
        {'text': 'Mumbai', 'score': 0},
        {'text': 'Lucknow', 'score': 0}
      ],
    },
    {
      'questionText': 'Who is the current prime minister of India?',
      'answers': [
        {'text': 'Atal Bihari Vajpayee', 'score': 0},
        {'text': 'Dr. APJ Abdul Kalam', 'score': 0},
        {'text': 'Narendra Modi', 'score': 1},
        {'text': 'Manmohan Singh', 'score': 0}
      ],
    },
    {
      'questionText': 'When is republic day of India?',
      'answers': [
        {'text': '26th January', 'score': 1},
        {'text': '14th march', 'score': 0},
        {'text': '27th November', 'score': 0},
        {'text': '25th December', 'score': 0}
      ],
    }
  ];
  // The things which are not the part of build function are not rrefreshed during hot reload
  var _currentQuestion = 0;
  var _totalScore = 0;
  void _onPressedAnswerToQuestion(int score) {
    // Set state is important because if we dont set this there is a possiblity that the flutter might change the state for every tap
    // We dont want that so we specifically mention flutter that we are about to change state so render again
    // Inside setState only that part should be added throught which we want to impact the state in UI
    // Here currentQuestion has impact on UI, so we put that inside
    _totalScore += score;
    setState(() {
      _currentQuestion += 1;
    });
    // Incrementing the currentQuestion when it was answered
    print(_currentQuestion);
    if (_currentQuestion < _questions.length) {
      print("We have more questions!");
    }
  }

  void resetState() {
    setState(() {
      _currentQuestion = 0;
      _totalScore = 0;
    });
  }

  // This is a decorator, provided by flutter
  // Make code and clean, we ovveride the default build method provided by StatelessWidget
  @override
  // Biuld method should have a build context
  // BuildContext is a class provided by flutter
  // Context is the object of BuildConext
  // This method is called whevever the app is being created and returns a widget
  // Widget is also a class
  // build method expects positional argument as BuildContext
  // context is provided by flutter we dont have to worry about
  Widget build(BuildContext context) {
    // Also given by flutter, expects named arguments
    // home is core widget when app is mounted on screen
    // Text is also a widget
    // Data is passed onto MaterialApp with the help of constructors
    // Every widget is a class which has a build method
    return MaterialApp(
      // Scaffold has job to create a base page design for the app
      // Gives a basic UI for app
      home: Scaffold(
        // Takes a preffered size widget
        // Creating an object of AppBar class or widget provided by flutter
        // Use CTRL + Space for all the expectations of any widget
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _currentQuestion < _questions.length
            ? Quiz(
                currentQuestion: _currentQuestion,
                questions: _questions,
                onPressedAnswerToQuestion: _onPressedAnswerToQuestion,
            )
            : Result(
                totalScore: _totalScore,
                resetState: resetState,
            ),
      ),
    );
  }
}

// What is state?
/*
  In General 
  State is Data/Information used by the app
  State can be the username or in our case its the currentQuestion

  App State
  Authenticated users
  Loaded Jobs

  Widget State
  Current User Input
  Is a Loading Spinner being shown?
  In our case the Widget state is according the current question that we have selected
*/

/*
  Stateless Widget
  It is a widget which renders a UI and can be only changed with the help of some external data
  there is no sych thing as internal state, 

  StateFul Widget
  It also has internal state meaning it can respond to certain buttons clicks inside the class itself
  We dont need to rerender the entire thing again
*/

/*
  What does setState does behind the scenes?
  setState forces flutter to rerender the UI, not the entire UI. Instead it calls
  build method again of this widget where you call setState, in our case it is the entire app. 
  Meaning it calls build method of MyAppState again
    But setState internally has many things which it goes through and that way it does not draw every single pixel
*/