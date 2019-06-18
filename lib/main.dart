import 'package:flutter/material.dart';
import 'view/Home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Noticias384',
      theme: new ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.red
      ),
      home: new Home(),
    );
  }
}