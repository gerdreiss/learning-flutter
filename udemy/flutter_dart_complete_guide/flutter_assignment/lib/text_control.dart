import 'package:flutter/material.dart';

import 'text_output.dart';

class TextControl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextControlState();
  }
}

class _TextControlState extends State<TextControl> {
  String _t = "This is the first assignment";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextOutput(_t),
        RaisedButton(
          child: Text("Change text"),
          onPressed: () {
            setState(() {
              _t = "And it works";
            });
          },
        ),
      ],
    );
  }
}
