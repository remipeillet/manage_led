import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/material_picker.dart';
import 'package:http/http.dart' as http;
import 'package:manage_led_app/model/bande_led.dart';
import 'package:manage_led_app/views/bande_led_details.dart';
import 'package:manage_led_app/widgets/stripe_led_card.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Gestion des bandes leds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestion des bandes leds'),
      ),
      body: StripeLedCardList(),
    );
  }
}

class StripeLedCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        StripeLedCard(stripeLed: StripeLedModel(id: 1,name: 'Haut', color: hexToColor('#9C27B0'), turnOn: true)),
        StripeLedCard(stripeLed: StripeLedModel(id: 2,name: 'Haut', color: hexToColor('#00BCD4'), turnOn: true)),
        StripeLedCard(stripeLed: StripeLedModel(id: 3,name: 'Haut', color: hexToColor('#757575  '), turnOn: true)),
      ],
    );
  }
}

