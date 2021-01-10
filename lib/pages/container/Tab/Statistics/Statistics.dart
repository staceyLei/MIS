import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatisticsState();
  }
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('统计页面'),
      ),
    );
  }
}
