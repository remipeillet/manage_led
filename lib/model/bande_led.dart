import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;

class StripeLedModel {
  int id;
  String name;
  Color color;
  bool turnOn;

  StripeLedModel({
    this.id,
    this.name,
    this.color,
    this.turnOn,
  });

  factory StripeLedModel.fromJson(Map<String, dynamic> json) => new StripeLedModel(
    id: json["id"],
    name: json["name"],
    color: hexToColor(json["color"]),
    turnOn: json["turnOn"]
  );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "color": color.toString(),
        "turnOn": turnOn
      };


}

Future<StripeLedModel> getBandeLed(int id) async {
  final response = await http.get('127.0.0.30/api/getbandeled/'+ id.toString());

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return StripeLedModel.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}