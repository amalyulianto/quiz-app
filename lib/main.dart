import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Just a simple question, can you understand me? uWu',
      'answers': [
        {'text': 'No', 'score': 5},
        {'text': 'Yes', 'score': 0},
        {'text': 'No', 'score': 5},
        {'text': 'Expect nothing, my bro.', 'score': 10},
      ],
    },
    {
      'questionText':
          'Which city do you wanna visit the most?',
      'answers': [
        {'text': 'Mecca', 'score': 10},
        {'text': 'Berlin', 'score': 9},
        {'text': 'Grenoble', 'score': 8},
        {'text': 'Tokyo', 'score': 7},
      ],
    },
    {
      'questionText': 'I want to live in...',
      'answers': [
        {'text': 'Saudi', 'score': 5},
        {'text': 'Malaysia', 'score': 7},
        {'text': 'Indonesia', 'score': 8},
        {'text': 'Germany', 'score': 10},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {

    });
    _questionIndex = 0;
    _totalScore = 0;
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Time is quiz!'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
