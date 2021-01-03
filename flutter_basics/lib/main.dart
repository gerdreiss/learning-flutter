import 'package:flutter/material.dart';

import 'data.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _data = [
    QuestionAndAnswers(
      'What\'s your favorite color?',
      ['Red', 'Green', 'Blue', 'White'],
    ),
    QuestionAndAnswers(
      'What\'s your favorite animal?',
      ['Dog', 'Cat', 'Turtle', 'Snake'],
    ),
    QuestionAndAnswers(
      'Who\'s your favorite instructive?',
      ['Alice', 'Bob', 'Charlie', 'Dick'],
    ),
  ];
  int _questionIndex = 0;
  Map<String, String> _results = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: Builder(
          builder: (context) => _questionIndex < _data.length
              ? Quiz(
                  _data,
                  _questionIndex,
                  (String question, String answer) =>
                      _updateState(context, question, answer),
                )
              : Result(
                  _results,
                  () => setState(() {
                    _questionIndex = 0;
                    _results = {};
                  }),
                ),
        ),
      ),
    );
  }

  void _updateState(BuildContext context, String question, String answer) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(answer),
        duration: Duration(milliseconds: 1000),
        action: SnackBarAction(
          label: 'X',
          onPressed: scaffold.hideCurrentSnackBar,
        ),
      ),
    );
    setState(() {
      _questionIndex += 1;
      _results[question] = answer;
    });
  }
}
