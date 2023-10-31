import 'package:flutter/material.dart';
import './form_widget.dart';
import './result_widget.dart';

void main(List<String> args) {
  runApp(const QuestionApp());
}

class QuestionAppState extends State<QuestionApp> {
  // Index for select questions
  var _selectQuestion = 0;
  var _totalScore = 0;

  final List<Map<String, Object>> _questions = const [
    {
      'text': 'Whats is your fav color?',
      'reply': [
        {'text': 'Black', 'score': 5},
        {'text': 'Blue', 'score': 10},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 2},
      ],
    },
    {
      'text': 'Whats is you name?',
      'reply': [
        {'text': 'Henry', 'score': 10},
        {'text': 'Clau', 'score': 4},
        {'text': 'July', 'score': 8},
        {'text': 'Marcus', 'score': 7},
      ],
    },
    {
      'text': 'Whats you age?',
      'reply': [
        {'text': '25', 'score': 10},
        {'text': '18', 'score': 8},
        {'text': '16', 'score': 7},
        {'text': '19', 'score': 9}
      ],
    }
  ];

  void _restartForm() {
    setState(() {
      _selectQuestion = 0;
      _totalScore = 0;
    });
  }

  void _reply(int score) {
    if (haveSelectQuestion) {
      setState(() {
        _selectQuestion++;
        _totalScore += score;
      });
    }

    return debugPrint(
        'Question answered: $_selectQuestion, Score: $score,  Total Score: $_totalScore');
  }

  bool get haveSelectQuestion {
    return _selectQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Questions'),
          ),
          body: haveSelectQuestion
              ? FormWidget(
                  selectQuestion: _selectQuestion,
                  questions: _questions,
                  reply: _reply)
              // Use Result Widget
              : ResultWidget(
                  totalScore: _totalScore,
                  restartForm: _restartForm,
                )),
    );
  }
}

class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  @override
  QuestionAppState createState() {
    return QuestionAppState();
  }
}
