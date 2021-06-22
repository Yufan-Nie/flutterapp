import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(false, () => print("you answered true")),
            new Expanded(
                child: new Material(
              color: Colors.greenAccent,
              child: new InkWell(
                onTap: () => print("you answered true"),
                child: new Center(
                    child: new Container(
                  child: new Text("True"),
                )),
              ),
            ))
          ],
        )
      ],
    );
  }
}
