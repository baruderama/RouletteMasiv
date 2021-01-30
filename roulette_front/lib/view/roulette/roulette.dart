import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:roulette_front/view/roulette/bets.dart';
import 'package:roulette_front/view/roulette/listWinners.dart';

var global;

class Roulette extends StatelessWidget {
  StreamController _dividerController = StreamController<int>.broadcast();
  final _wheelNotifier = StreamController<double>();
  Duration d = new Duration(seconds: 5);
  //Stream s = _dividerController.stream;
  int n = 0;

  dispose() {
    _dividerController.close();
    _wheelNotifier.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffDDC3FF), elevation: 0.0),
      backgroundColor: Color(0xffDDC3FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinningWheel(
              Image.asset('assets/images/roulette.png'),
              width: 400,
              height: 400,
              initialSpinAngle: _generateRandomAngle(),
              spinResistance: 0.3,
              canInteractWhileSpinning: false,
              dividers: 37,
              onUpdate: _dividerController.add,
              onEnd: _dividerController.add,
              secondaryImage: Image.asset('assets/images/arrow.png'),
              secondaryImageHeight: 190,
              secondaryImageWidth: 190,
              shouldStartOrStop: _wheelNotifier.stream,
            ),
            SizedBox(height: 30),
            StreamBuilder(
              stream: _dividerController.stream,
              builder: (context, snapshot) =>
                  snapshot.hasData ? RouletteScore(snapshot.data) : Container(),
            ),
            RaisedButton(
              child: Text('Spin the Roulette'),
              shape: StadiumBorder(),
              onPressed: () {
                _wheelNotifier.sink.add(_generateRandomVelocity());
                _dividerController.stream.listen((event) {
                  print('value: $event');
                  n = event;
                  debugPrint(n.toString() + "hey");
                  choosen = n;
                });
                //debugPrint(n.toString() + "hey");
                //sleep(d);
              },
            ),
            RaisedButton(
              child: Text('Close Bets'),
              shape: StadiumBorder(),
              onPressed: () {
                debugPrint(n.toString() + "hey2");

                for (var i = 0; i < todos.length; i++) {
                  if (n.toString() == todos[i]) {
                    int price = int.parse(todos2[i]);
                    int winnersPrice = price * 5;
                    winners.add("user: " +
                        i.toString() +
                        " price " +
                        winnersPrice.toString());
                  } else {
                    if (n % 2 == 0) {
                      int price = int.parse(todos2[i]);
                      int winnersPrice = price * 2;
                      winners.add("user: " +
                          i.toString() +
                          " price " +
                          winnersPrice.toString());
                    } else {
                      int price = int.parse(todos2[i]);
                      int winnersPrice = price * 2;
                      winners.add("user: " +
                          i.toString() +
                          " price " +
                          winnersPrice.toString());
                    }
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => ListWinners()));
                  }
                }
                //sleep(d);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<int> hey() async {
    return this.n;
  }

  double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;
  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}

//RouletteScore r = new RouletteScore(0);
//r.send

class RouletteScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: '32',
    2: '15',
    3: '19',
    4: '4',
    5: '21',
    6: '2',
    7: '25',
    8: '17',
    9: '34',
    10: '6',
    11: '27',
    12: '13',
    13: '36',
    14: '11',
    15: '30',
    16: '8',
    17: '23',
    18: '10',
    19: '5',
    20: '24',
    21: '16',
    22: '33',
    23: '1',
    24: '20',
    25: '14',
    26: '31',
    27: '9',
    28: '22',
    29: '18',
    30: '29',
    31: '7',
    32: '28',
    33: '12',
    34: '35',
    35: '3',
    36: '26',
    37: '0',
  };

  RouletteScore(this.selected);

  Future<int> send() async {
    return selected;
  }

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]}',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
  }
}
