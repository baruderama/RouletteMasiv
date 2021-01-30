import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roulette_front/model/RouletteM.dart';
import 'package:roulette_front/services/EndPoints.dart';
import 'package:roulette_front/view/roulette/bets.dart';
import 'package:roulette_front/view/roulette/roulette.dart';
import 'package:roulette_front/view/rouletteList/rouletteList.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        Colors.white,
        Colors.yellow[200],
        Colors.blue,
        Colors.blue[700],
      ])),
      child: Column(children: <Widget>[
        SizedBox(
          height: 300,
        ),
        FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          //   side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
          onPressed: () async {
            var res = await EndPoints().addRoulette();
            debugPrint(res);
            var newRoulette = json.decode(res);
            debugPrint(newRoulette['id'].toString());
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("a Roulette has been created with the code:"),
                    content: Text(newRoulette['id'].toString()),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () async {
                            RouletteM r = new RouletteM(
                              id: newRoulette['id'].toString(),
                              state: 'open',
                            );
                            currentRoulette =
                                await EndPoints().updateRoulette(r);
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Bets()));
                          },
                          child: Text("Open Roulette"))
                    ],
                  );
                });
          },
          padding: EdgeInsets.symmetric(horizontal: 50),
          color: Colors.white,
          textColor: Colors.blue,
          child: Text("Create a Roulette ", style: TextStyle(fontSize: 20)),
        ),
        SizedBox(
          height: 30,
        ),
        FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          //   side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
          onPressed: () async {
            var res = await EndPoints().getRoulettes();
            debugPrint(res.toString());
            for (var a = 0; a < res.length; a++) {
              todosR.add("ruleta:" + a.toString());
            }
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => RouletteList()));
          },
          padding: EdgeInsets.symmetric(horizontal: 50),
          color: Colors.white,
          textColor: Colors.blue,
          child: Text("See list of Roulettes ", style: TextStyle(fontSize: 20)),
        ),
      ]),
    ));
  }
}
