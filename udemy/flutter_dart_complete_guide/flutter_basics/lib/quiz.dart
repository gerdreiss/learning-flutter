import 'package:flutter/material.dart';

import 'answer.dart';
import 'data.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<QuestionAndAnswers> qas;
  final int questionIndex;
  final Function handler;

  const Quiz(
    this.qas,
    this.questionIndex,
    this.handler,
  );

  @override
  Widget build(BuildContext context) {
    var question = qas[questionIndex].question;
    var answers = qas[questionIndex].answers;
    return Column(
      children: [
        Question(question),
        ...answers
            .map(
              (answer) => Answer(
                answer,
                () => handler(question, answer),
              ),
            )
            .toList()
      ],
    );
  }
}
