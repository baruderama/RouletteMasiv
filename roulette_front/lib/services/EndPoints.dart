import 'dart:async';
import 'dart:convert';
//import 'dart:html';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roulette_front/model/RouletteM.dart';
import 'package:uuid/uuid.dart';

class EndPoints {
  String endpointBack = 'http://192.168.0.22:8080';

  Future<String> addRoulette() async {
    var uuid = Uuid();
    Map data2 = {
      'id': uuid.v4().toString(),
      'state': '',
      'bets': null,
    };
    //var body = json.encode(data2);

    http.Response response = await http.post(this.endpointBack + '/roulettes',
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data2));

    debugPrint(response.body);
    String i = response.body;
    return i;
    //data = json.decode(response.body);
  }

  Future<Map> getRoulettes() async {
    http.Response response = await http.get(this.endpointBack + '/roulettes');

    debugPrint(response.body);
    String i = response.body;
    Map rouletteList = json.decode(i);
    debugPrint(rouletteList.toString() + "hola");

    return rouletteList;
    //data = json.decode(response.body);
  }

  Future<String> updateRoulette(RouletteM m) async {
    Map data2 = {
      'id': m.id,
      'state': m.state,
      'bets': m.bets,
    };

    http.Response response = await http.put(
        this.endpointBack + '/updateRoulette',
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data2));
    debugPrint(response.body + "hey");
    String i = response.body;
    return i;
    //data = json.decode(response.body);
  }
}
