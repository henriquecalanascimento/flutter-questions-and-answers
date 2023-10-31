import 'package:flutter/material.dart';
import 'question_widget.dart';
import './reply_buttons_widget.dart';

void main(List<String> args) {
  runApp(const QuestionApp());
}

class QuestionAppState extends State<QuestionApp> {
  // Index for select questions
  var _selectQuestion = 0;

  @override
  Widget build(BuildContext context) {
    //List of Question and Reply
    final List<Map<String, Object>> questions = [
      {
        'text': 'Whats is your fav color?',
        'reply': ['Black', 'Blue', 'Green', 'White'],
      },
      {
        'text': 'Whats is you name?',
        'reply': ['Henry', 'Clau', 'July', 'Marcus'],
      },
      {
        'text': 'Whats you age?',
        'reply': ['25', '18', '16', '19'],
      }
    ];

    // Loop on Questions and repply
    List<Widget> awnswers = [];
    for (String replyText in questions[_selectQuestion].cast()['reply']) {
      awnswers.add(ReplyButtonsWidget(
        text: replyText,
        replyFunc: _reply,
      ));
      debugPrint('Reply: $replyText');
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Questions'),
        ),
        body: Column(
          children: [
            Question(text: questions[_selectQuestion]['text'].toString()),

            //Spread operator combine value of list on unique list.
            ...awnswers
          ],
        ),
      ),
    );
  }

  void _reply() {
    setState(() {
      _selectQuestion++;
    });

    return debugPrint('Question answered: $_selectQuestion');
  }
}

class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  @override
  QuestionAppState createState() {
    return QuestionAppState();
  }
}
