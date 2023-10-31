import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const QuestionApp());
}

class QuestionApp extends StatelessWidget {
  const QuestionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Questions'),
        ),
        body: const Text('Hello Flutter'),
      ),
    );
  }
}
