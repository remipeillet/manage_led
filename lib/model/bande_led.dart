import 'dart:convert';

import 'package:http/http.dart' as http;

class BandeLed {
  int id;
  String name;
  String color;
  bool turnOn;

  BandeLed({
    this.id,
    this.name,
    this.color,
    this.turnOn,
  });

  factory BandeLed.fromJson(Map<String, dynamic> json) => new BandeLed(
    id: json["id"],
    name: json["name"],
    color: json["color"],
    turnOn: json["turnOn"]
  );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "color": color,
        "turnOn": turnOn
      };


}

Future<BandeLed> getBandeLed(int id) async {
  final response = await http.get('127.0.0.30/api/getbandeled/'+ id.toString());

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return BandeLed.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}