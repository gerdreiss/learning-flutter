import 'package:flutter/material.dart';

import 'text_control.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text("Assignment 1"),
        ),
        body: Center(
          child: TextControl(),
        ),
      ),
    );
  }
}
