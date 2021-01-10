import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:MIS/route/route.dart';
import 'package:MIS/assets/style.dart' as style;
import './Item.dart';
import './const.dart';

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
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Column(
                children: <Widget>[
                  Container(
                    width: style.width,
                    padding:
                        EdgeInsets.fromLTRB(15, style.topPadding + 5, 15, 10),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: style.borderColor, width: 0.5)),
                      color: Colors.white,
                    ),
                    child: Row(children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              navigatorKey.currentState.pushNamed('/SearchPage',
                                  arguments: {'from': 'student'});
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                              decoration: BoxDecoration(
                                color: style.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text('搜索', style: style.hintStyle),
                                  Container(
                                    width: 22,
                                    height: 22,
                                    child: Icon(Icons.search,
                                        size: 22, color: style.hintColor),
                                  )
                                ],
                              ),
                            )),
                      )
                    ]),
                  ),
                  Expanded(
                      flex: 1,
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: 10),
                          itemCount: stuData.length,
                          itemBuilder: (context, index) {
                            return Item(item: stuData[index]);
                          }))
                ],
              ),
            )));
  }
}
