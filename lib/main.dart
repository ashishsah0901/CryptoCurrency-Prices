import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';

void main() async {
  List currencies = await getcurrency();
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS
            ? Colors.grey[100]
            : null,
      ),
      home: HomePage(_currencies),
    );
  }
}

Future<List> getcurrency() async {
  String url =
      "https://api.nomics.com/v1/currencies/ticker?key=4bd5a7c3c6c1a7e312945c0d5bf99515e4dad5f4&interval=1d,30d&convert=INR&per-page=100&page=1";
  http.Response response = await http.get(Uri.parse(url));
  return json.decode(response.body);
}
