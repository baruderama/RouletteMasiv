import 'dart:core';

import 'package:flutter/material.dart';

import 'package:roulette_front/view/roulette/roulette.dart';

List todosR = List();

class RouletteList extends StatefulWidget {
  @override
  _RouletteState createState() => _RouletteState();
}

class _RouletteState extends State<RouletteList> {
  String input = "";

  @override
  void initState() {
    super.initState();
    todosR.add("item1");
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
                  title: Text("Put your bet"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Roulette().hey();
                          setState(() {
                            todosR.add(input);
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
        itemCount: todosR.length,
        itemBuilder: (BuildContext context, int index) {
          /*return Dismissible(
              key: Key(todos[index]),
              child: Card(
                child: ListTile(
                  title: Text(todos[index]),
                ),
              ));*/
          return ListTile(
            title: Text(todosR[index]),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("My title"),
                      content: Text("This is my message."),
                    );
                  });
            },
          );
        },
      ),
      persistentFooterButtons: [
        RaisedButton(
          child: Text('Close Bets'),
          shape: StadiumBorder(),
          onPressed: () {
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
