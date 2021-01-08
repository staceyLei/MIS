import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:MIS/assets/style.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller = ScrollController();
  double _t;
  double topPadding = MediaQueryData.fromWindow(window).padding.top;
  double width = MediaQueryData.fromWindow(window).size.width;
  final double DEFAULT_BAR = MediaQueryData.fromWindow(window).padding.top + 44;

  double _barOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    this._controller.addListener(() {
      _t = this._controller.offset / DEFAULT_BAR;
      setState(() {
        if (this._t >= 1.0) {
          this._barOpacity = 1.0;
        } else if (this._t < 0.0) {
          this._barOpacity = 0.0;
        } else {
          this._barOpacity = this._t;
        }
      });
    });
  }

//渲染头部
  List<Widget> renderNavBar() {
    return <Widget>[
      ClipOval(
        child: Icon(Icons.people),
      ),
      SizedBox(width: 20),
      Expanded(
        child: Text('早上好 今天是周三',
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        flex: 1,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
// 上下边距 （主要用于 刘海  和  内置导航键）
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
            backgroundColor: bgColor,
            body: Stack(alignment: Alignment.centerLeft, children: <Widget>[
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: SingleChildScrollView(
                  controller: this._controller,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 260.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 210.0,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(37, 177, 135, 1),
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(50.0))),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: topPadding + 10),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(37, 177, 135, 1),
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(50.0))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Icon(Icons.people),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text(
                                      'HI XXX 早上好',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text('内容'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ])));
  }
}
