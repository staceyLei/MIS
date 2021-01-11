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
  List _searchWord = [];
  List _searchRes = [];
  String _searchType = 'name';
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

  List<Widget> _renderKeyWord() {
    _searchWord = searchWord;
    return _searchWord.map((item) {
      return InkWell(
          onTap: () {
            this.setState(() {
              _searchType = item['key'];
            });
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
            margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(item['title'], style: style.mFontStyle),
          ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: style.themeColor,
      body: MediaQuery.removePadding(
        context: context,
        // removeTop: true,
        child: Column(children: [
          Container(
            width: style.width,
            padding: EdgeInsets.fromLTRB(15, style.topPadding + 5, 15, 5),
            decoration: BoxDecoration(color: style.themeColor),
            child: // 搜索框
                Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
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
                                contentPadding: EdgeInsets.only(bottom: 11),
                                prefixIcon: Container(
                                  width: 22,
                                  height: 22,
                                  child: Icon(
                                    Icons.search,
                                    size: 22,
                                    color: style.hintColor,
                                  ),
                                ),
                                hintText: '搜索${typeMap[_searchType]}',
                                hintStyle: style.hintStyle.copyWith(
                                  fontSize: style.mFontSize,
                                ),
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
                            color: Colors.white, fontSize: style.mFontSize)),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                decoration: BoxDecoration(color: style.grey),
                width: style.width,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      child: Text(
                        '按指定类别搜索',
                        style: style.mFontStyle
                            .copyWith(fontSize: style.titleSize),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Container(
                          width: style.width * 0.6,
                          child: Wrap(
                            children: _renderKeyWord(),
                          ),
                        ),
                      ),
                      width: style.width,
                      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    )
                  ],
                )),
          )
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
