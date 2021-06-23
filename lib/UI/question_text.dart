import 'package:flutter/material.dart';
import 'package:flutterapp/UI/correct_wrong_overlay.dart';

class QuestionText extends StatefulWidget {
  final String _question;
  final int _questionNumber;
  QuestionText(this._question, this._questionNumber);

  @override
  State createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText>
    with SingleTickerProviderStateMixin {
  late Animation<double> _fonSizeAnimation;
  late AnimationController _fonSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _fonSizeAnimationController = new AnimationController(
        duration: new Duration(microseconds: 500), vsync: this);
    _fonSizeAnimation = new CurvedAnimation(
        parent: _fonSizeAnimationController, curve: Curves.bounceInOut);
    _fonSizeAnimation.addListener(() => this.setState(() {}));
    _fonSizeAnimationController.forward();
  }

  @override
  void dispose() {
    _fonSizeAnimationController.dispose();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._question != widget._question) {
      _fonSizeAnimationController.reset();
      _fonSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          child: new Text(
            "flutter" +
                widget._questionNumber.toString() +
                ":" +
                widget._question,
            style: new TextStyle(fontSize: _fonSizeAnimation.value * 15),
          ),
        ),
      ),
    );
  }
}
