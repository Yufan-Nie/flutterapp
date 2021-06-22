import 'package:flutterapp/utils/question.dart';

class Quiz {
  //在dart中没有private关键字来标志一个东西是私有的。只需要在变量前添加一个下划线（_）即可
  List<Question> _questions;
  int _currentQuestionIndex = -1;
  int _score = 0;
  Quiz(this._questions) {
    _questions.shuffle();
  }

  //创建getters方法，方法名为score返回score
  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get questionNumber => _currentQuestionIndex + 1;
  int get score => _score;

  Question? get nextQuestion {
    _currentQuestionIndex++;
    if (_currentQuestionIndex >= length) return null;
    return _questions[_currentQuestionIndex];
  }

//需要一个方法来接收用户回答了什么答案
  void answer(bool isCorrect) {
    if (isCorrect) _score++;
  }
}
