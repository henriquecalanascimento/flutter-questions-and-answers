import 'package:flutter/material.dart';
import './question_widget.dart';
import './reply_buttons_widget.dart';

class FormWidget extends StatelessWidget {
  //Variables
  final int selectQuestion;
  final List<Map<String, Object>> questions;
  final void Function(int score) reply;

  // Named Constructor
  const FormWidget(
      {super.key,
      required this.selectQuestion,
      required this.questions,
      required this.reply});

  bool get haveSelectQuestion {
    return selectQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    // List of Dynamic Widget with Validaiton using IF ternary
    List<Map<String, Object>> replys = haveSelectQuestion
        ? questions[selectQuestion]['reply'] as List<Map<String, Object>>
        : [];

    // Use a List of String, Transform to List of Widget and return other list and collect score
    List<Widget> widgets = replys
        .map((textReturned) => ReplyButtonsWidget(
            text: textReturned['text'] as String,
            replyFunc: () =>
                reply(int.parse(textReturned['score'].toString()))))
        .toList();

    // List of Dynamic Widget with For
    // for (String replyText in replys) {
    //   widgets.add(ReplyButtonsWidget(
    //     text: replyText,
    //     replyFunc: _reply,
    //   ));
    //   debugPrint('Reply: $replyText');
    // }

    return Column(
      children: [
        Question(text: questions[selectQuestion]['text'].toString()),

        //Spread operator combine value of list on unique list.
        ...widgets
      ],
    );
  }
}
