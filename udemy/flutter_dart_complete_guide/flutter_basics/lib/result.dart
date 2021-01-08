import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Map<String, String> answers;
  final Function handler;

  const Result(this.answers, this.handler);

  @override
  Widget build(BuildContext context) {
    var tableRows = answers.entries
        .map((entry) => TableRow(
              children: [
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      entry.key,
                      style: TextStyle(fontSize: 18),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Text(entry.value, style: TextStyle(fontSize: 18)),
                ),
              ],
            ))
        .toList();
    return Column(
      children: [
        Table(
          border: TableBorder.all(),
          columnWidths: {
            0: FractionColumnWidth(.75),
            1: FractionColumnWidth(.25),
          },
          children: tableRows,
        ),
        Container(
            margin: EdgeInsets.only(top: 20),
            child: FlatButton(
              child: Text(
                "New",
                style: TextStyle(fontSize: 18),
              ),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: handler,
            ))
      ],
    );
  }
}
