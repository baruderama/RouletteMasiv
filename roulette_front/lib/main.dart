import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roulette_front/view/homePage.dart';

import 'view/roulette/bets.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
