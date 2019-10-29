import 'package:flutter/material.dart';
import './questions.dart';
import './answers.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> qslist;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({this.qslist, this.answerQuestion, this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(qslist[questionIndex]["questionText"]),
        ...(qslist[questionIndex]["answers"] as List<Map<String, Object>>).map(
          (answer) {
            return Answer(
                () => answerQuestion(answer['score']), answer['text']);
          },
        ).toList(),
      ],
    );
  }
}
