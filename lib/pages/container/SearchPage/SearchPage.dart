import 'package:MIS/route/route.dart';
import 'package:flutter/material.dart';
import 'package:MIS/assets/style.dart' as style;
import 'const.dart';

class SearchPage extends StatefulWidget {
  final arguments;
  SearchPage({this.arguments});
  @override
  State<SearchPage> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  List _history = [];
  List _searchRes = [];
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      bool focus = _focusNode.hasFocus;
      if (!focus) {
        this.setState(() {
          _searchRes = [];
        });
      }
    });
  }

  List<Widget> _renderHistory() {
    _history = history;
    return _history.map((item) {
      return InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            decoration: BoxDecoration(
              color: Color.fromRGBO(232, 232, 232, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(item, style: style.baseFontStyle),
          ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: style.grey,
      body: Container(
        padding: EdgeInsets.fromLTRB(15, style.topPadding + 10, 15, 0),
        child: Column(children: [
          // 搜索框
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 20.0,
                      ),
                      child: TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          style: style.mFontStyle,
                          autofocus: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 10),
                              prefixIcon: Container(
                                width: 22,
                                height: 22,
                                padding: EdgeInsets.all(2.5),
                                child: Icon(
                                  Icons.search,
                                  size: 22,
                                  color: style.hintColor,
                                ),
                              ),
                              hintText: '搜索姓名',
                              hintStyle: style.hintStyle
                                  .copyWith(fontSize: style.mFontSize),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ))),
                    )),
              ),
              InkWell(
                onTap: () {
                  navigatorKey.currentState.pop();
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text('取消',
                      style: TextStyle(
                          color: style.lightGrey, fontSize: style.mFontSize)),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Container(
            child: Text(
              '搜索指定内容',
              style: style.mFontStyle,
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Text('历史搜索',
          //         style:
          //             style.baseFontStyle.copyWith(fontSize: style.mFontSize)),
          //   ],
          // ),
        ]),
      ),
    );
  }
}
