import 'dart:ui';

import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueGrey,
      child: new InkWell(
        onTap: () => print("我爱学习"),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Hello everyone!",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold),
            ),
            new Text(
              "I'm wang Xiaofan",
              style: new TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
