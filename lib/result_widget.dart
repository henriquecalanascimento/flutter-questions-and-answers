import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final int totalScore;
  final void Function() restartForm;

  const ResultWidget(
      {super.key, required this.totalScore, required this.restartForm});

  String get resultText {
    if (totalScore < 14) {
      return "Congratulations!!!";
    } else if (totalScore < 20) {
      return "You are good!!!!";
    } else if (totalScore < 26) {
      return "Impressive!";
    }

    return 'OHHHHH JEDI LEVEL"';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(resultText, style: const TextStyle(fontSize: 28)),
        ),
        TextButton(
          onPressed: restartForm,
          style: TextButton.styleFrom(
              backgroundColor: Colors.green, foregroundColor: Colors.black),
          child: const Text(
            "Restart?",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
