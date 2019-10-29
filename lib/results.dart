import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get reslutPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = "Well u got me";
    } else if (resultScore <= 12) {
      resultText = "good to know u";
    } else if (resultScore <= 20) {
      resultText = "great job let hangout";
    } else {
      resultText = "not great";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          reslutPhrase,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        
        FlatButton(
          child: Text("Reset "),
          onPressed: resetHandler,
        )
      ]),
    );
  }
}
