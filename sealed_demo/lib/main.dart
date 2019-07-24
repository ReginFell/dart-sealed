import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sealed_demo/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Result result = Idle();

  void _changeState() {
    setState(() {
      var value = Random().nextInt(3);
      if (value == 0) {
        result = Failure();
      } else if (value == 1) {
        result = Success("Value from success");
      } else if (value == 2) {
        result = Idle();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var resultWidget = result.when((success) => Text(success.value),
        (failure) => Text("Failure"), (idle) => Text("idle"));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            resultWidget,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeState,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
