import 'package:flutter/material.dart';
import 'package:flutterapp/UI/question_text.dart';
import 'package:flutterapp/utils/question.dart';
import 'package:flutterapp/utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/correct_wrong_overlay.dart';
import 'score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  late Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("question", false),
    new Question("你是猪吗", false),
    new Question("flutter好用吗", true)
  ]);
  late String questionText;
  late int questionNumber;
  late bool isCorrect;
  late bool overlayShouldBeVisible = false;
  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion!;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          //this is our main page
          children: <Widget>[
            new AnswerButton(false, () => handleAnswer(false)), //true button
            new QuestionText(questionText, questionNumber),
            new AnswerButton(true, () => handleAnswer(true)), //false button

/*             new Expanded(
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
  */
          ],
        ),
        overlayShouldBeVisible == true
            ? new CorrectWrongOverlay(isCorrect, () {
                if (quiz.length == questionNumber) {
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new ScorePage(quiz.score, quiz.length)),
                      // ignore: unnecessary_null_comparison
                      (Route route) => route == null);
                  return;
                }

                currentQuestion = quiz.nextQuestion!;
                this.setState(() {
                  overlayShouldBeVisible = false;
                  questionText = currentQuestion.question;
                  questionNumber = quiz.questionNumber;
                });
              })
            : new Container()
      ],
    );
  }
}
