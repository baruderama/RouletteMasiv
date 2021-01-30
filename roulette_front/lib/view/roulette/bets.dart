import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:roulette_front/model/RouletteM.dart';
import 'package:roulette_front/services/EndPoints.dart';

import 'package:roulette_front/view/roulette/roulette.dart';

var currentRoulette;
List<String> todos = List<String>();
List<String> todos2 = List<String>();

class Bets extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Bets> {
  String input = "";
  String input2 = "";
  TextEditingController _betFieldController = TextEditingController();
  TextEditingController _moneyControllerField = TextEditingController();

  @override
  void initState() {
    super.initState();
    todos.add("item1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bets"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                      "Put your bet(put a number between 0 and 36 or red/black) : "),
                  content: Form(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                    TextFormField(
                      controller: _betFieldController,
                      validator: (value) {
                        return value.isNotEmpty ? null : "Invalid Field";
                      },
                      decoration: InputDecoration(hintText: "ej: 15 or black "),
                      onChanged: (String value) {
                        input = value;
                      },
                    ),
                    TextFormField(
                      controller: _moneyControllerField,
                      onChanged: (String value) {
                        input2 = value;
                      },
                      decoration: InputDecoration(
                          hintText: "Put how much you want to bet"),
                    ),
                  ])),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Roulette().hey();
                          setState(() {
                            todos.add(input);
                            todos2.add(input2);
                          });
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },
        child: Text("BET"),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: Key(todos[index]),
              child: Card(
                child: ListTile(
                  title: Text(todos[index]),
                ),
              ));
        },
      ),
      persistentFooterButtons: [
        RaisedButton(
          child: Text('Close Bets'),
          shape: StadiumBorder(),
          onPressed: () async {
            var rCurrentRoulette = json.decode(currentRoulette);
            RouletteM r = new RouletteM(
                id: rCurrentRoulette['id'].toString(),
                state: rCurrentRoulette['state'].toString(),
                bets: todos);
            currentRoulette = await EndPoints().updateRoulette(r);
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => Roulette()));
          },
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
