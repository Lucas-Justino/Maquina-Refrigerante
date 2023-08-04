import 'package:flutter/material.dart';
import 'package:untitled/interfaces/main.widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maquina Refrigerante',
      theme: ThemeData(
        fontFamily: 'Baloo 2',
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: MainWidget(),
          ),
        ),
      ),
    );
  }
}

