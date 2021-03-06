import 'package:flutter/material.dart';
import 'Course/Course.dart';
import 'Statistics/Statistics.dart';
import 'MyCenter/MyCenter.dart';
import 'HomePage/HomePage.dart';
import 'package:MIS/assets/style.dart' as style;

class Tabs extends StatefulWidget {
  final arguments;
  Tabs({Key key, this.arguments}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    var currentIndex = arguments == null ? 0 : arguments['currentIndex'];
    return _TabsState(currentIndex: currentIndex);
  }
}

class _TabsState extends State<Tabs> {
  var pages = [
    HomePage(),
    Statistics(),
    MyCenter(),
  ];
  int _currentIndex;
  _changeIndex(v) {
    setState(() {
      _currentIndex = v;
    });
  }

  _TabsState({int currentIndex}) {
    this._currentIndex = currentIndex;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: this._changeIndex,
        currentIndex: this._currentIndex,
        unselectedItemColor: Colors.grey[600],
        unselectedFontSize: 14.0,
        selectedFontSize: 14.0,
        type: BottomNavigationBarType.fixed,
        iconSize: 26.0,
        items: [
          BottomNavigationBarItem(
            title: Text('学生'),
            icon: Icon(Icons.people),
            activeIcon: Icon(Icons.people),
          ),
          BottomNavigationBarItem(
            title: Text('统计'),
            icon: Icon(Icons.insert_chart),
            activeIcon: Icon(Icons.insert_chart),
          ),
          BottomNavigationBarItem(
            title: Text('我的'),
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
