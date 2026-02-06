import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stats'),
        ),
        body: Text('Stats Here'),
      ),
    );
  }
}
