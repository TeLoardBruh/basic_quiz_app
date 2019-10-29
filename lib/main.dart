import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import './quiz.dart';
import './results.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questuonIndex = 0;
  final _qslist = const [
    {
      "questionText": "What\'s your fav color,",
      "answers": [
        {"text": "RED", "score": 10},
        {"text": "BLUE", "score": 3},
        {"text": "GREEN", "score": 4},
        {"text": "PINK", "score": 0}
      ]
    },
    {
      "questionText": "What\'s your fav coffee,",
      "answers": [
        {"text": "LATTE", "score": 5},
        {"text": "AMERICANO", "score": 5},
        {"text": "COPUCCI", "score": 4},
        {"text": "CAMERAMAL", "score": 0}
      ]
    },
    {
      "questionText": "What\'s your fav game,",
      "answers": [
        {"text": "CSGO", "score": 5},
        {"text": "FIFA", "score": 5},
        {"text": "MINCRAFT", "score": 3},
        {"text": "RACING CAR", "score": 0}
      ]
    },
  ];
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questuonIndex = _questuonIndex + 1;
    });
    if (_questuonIndex < _qslist.length) {
      print("more ");
    } else {
      print("error");
    }
    print(_questuonIndex);
  }

  // =====reset=====
  void _resetQuiz() {
    setState(() {
      _questuonIndex = 0;
      _totalScore = 0;
    });
  }

  // =====reset=====END
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: _questuonIndex < _qslist.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questuonIndex,
                qslist: _qslist)
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
