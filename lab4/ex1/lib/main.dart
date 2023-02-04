import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'firstRoute.dart';
import 'secondRoute.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Navigation',
    theme: ThemeData(
      // This is the theme of your application.
      primarySwatch: Colors.green,
    ),
    //home: FirstScreen(),
    initialRoute: '/',
    routes: {
      '/': (context) => FirstScreen(),
      '/second': (context) => SecondScreen(),
    },
    //
  ));
}
