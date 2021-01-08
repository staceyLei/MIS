import 'package:flutter/material.dart';
import 'package:MIS/assets/style.dart' as style;

class MyCenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCenterState();
  }
}

class _MyCenterState extends State<MyCenter> {
  //给定一个标题的高度
  final double DEFAULT_BAR = style.topPadding + 44;
  ScrollController _controller = ScrollController();
  double _barOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    double t;
    //滚动条监听，下拉时改变透明度
    _controller.addListener(() {
      //计算标题相对于滚动距离的比例
      t = _controller.offset / DEFAULT_BAR;
      //设置滚动条状态，状态改变组件重新加载
      setState(() {
        if (t >= 1.0) {
          this._barOpacity = 1.0;
        } else if (t < 0.0) {
          this._barOpacity = 0.0;
        } else {
          this._barOpacity = t;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.bgColor,
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: style.width,
                        height: 310,
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding:
                              EdgeInsets.fromLTRB(15, style.topPadding, 15, 15),
                          width: style.width,
                          height: 230,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(45, 118, 202, 0.9),
                                Color.fromRGBO(72, 131, 202, 0.8),
                              ],
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      //路由跳转例子，跳转到定义为Setup的路由
                                      // Navigator.pushNamed(context, '/SetUp');
                                    },
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      child: Icon(Icons.settings),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text('内容'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
