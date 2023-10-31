import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(QuestionApp());
}

class QuestionApp extends StatelessWidget {
  QuestionApp({super.key});

  var SelectQuestion = 1;

  void reply() {
    //print('Question answered:');
    return debugPrint('Question answered:');
  }

  @override
  Widget build(BuildContext context) {
    final List<String> questions = [
      'Whats is your fav color?',
      'Whats is you name?',
      'Whats you age?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Questions'),
        ),
        body: Column(
          children: [
            Text(questions[SelectQuestion]),
            ElevatedButton(onPressed: reply, child: const Text("Awnswer 1:")),
            ElevatedButton(onPressed: reply, child: const Text("Awnswer 2:")),
            ElevatedButton(onPressed: reply, child: const Text("Awnswer 3:")),
          ],
        ),
      ),
    );
  }
}
