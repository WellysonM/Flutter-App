import 'package:flutter/material.dart';

import 'pages/DragNDropPage.dart';
import 'pages/ListViewHor.dart';
import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    HomePage.tag: (context) => HomePage(),
    ListViewHor.tag: (context) => ListViewHor(),
    DragNDropPage.tag: (context) => DragNDropPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: routes,
    );
  }
}
