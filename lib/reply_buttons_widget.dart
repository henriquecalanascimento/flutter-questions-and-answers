import 'package:flutter/material.dart';

class ReplyButtonsWidget extends StatelessWidget {
  // Attrs
  final String text;
  final void Function() replyFunc;

  // Constructor
  const ReplyButtonsWidget(
      {required this.text, required this.replyFunc, super.key});

  // Build Widget
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: replyFunc,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor: const Color.fromARGB(255, 39, 5, 234),
            textStyle: const TextStyle(fontSize: 20)),
        child: Text(text),
        //style: ButtonStyle(textStyle: Colors.blue, backgroundColor: ),
      ),
    );
  }
}
