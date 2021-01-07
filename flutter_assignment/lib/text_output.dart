import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  final String text;

  const TextOutput(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 4,
        bottom: 10,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
