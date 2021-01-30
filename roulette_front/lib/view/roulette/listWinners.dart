import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:roulette_front/model/RouletteM.dart';
import 'package:roulette_front/services/EndPoints.dart';

import 'package:roulette_front/view/roulette/roulette.dart';

var choosen;
List<String> winners = List<String>();

class ListWinners extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<ListWinners> {
  List<String> todos = List<String>();
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
        title: Text("Winners"),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: Key(winners[index]),
              child: Card(
                child: ListTile(
                  title: Text(winners[index]),
                ),
              ));
        },
      ),
      persistentFooterButtons: [],
    );
  }
}
