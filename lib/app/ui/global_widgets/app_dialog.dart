import 'package:flutter/material.dart';

class DialogMessage extends StatelessWidget {
  const DialogMessage({Key? key, required this.title, required this.message})
      : super(key: key);
  final String title;
  final String message;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }
}

 