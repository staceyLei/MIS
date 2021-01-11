import 'package:MIS/route/route.dart';
import 'package:flutter/material.dart';
import 'package:MIS/assets/style.dart' as style;
import 'const.dart';

class StudentDetail extends StatefulWidget {
  final arguments;
  StudentDetail({this.arguments});
  @override
  State<StudentDetail> createState() {
    return _StudentDetailState(arguments: arguments);
  }
}

class _StudentDetailState extends State<StudentDetail> {
  var _stuInfo;
  TextEditingController _controller = TextEditingController();
  _StudentDetailState({arguments}) {
    this._stuInfo = arguments['stuInfo'];
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text('学生信息', style: TextStyle(color: Colors.white, fontSize: 20)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
        height: style.height,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(color: Colors.white, border: style.borderS),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: style.baseRadius,
                    // image: DecorationImage(
                    //     image: AssetImage(item['img']), fit: BoxFit.cover)
                    color: Colors.grey[300]),
                child: Icon(
                  Icons.person,
                  size: style.width * 0.4,
                  color: Colors.white,
                ),
                width: style.width * 0.4,
                height: style.width * 0.6,
              ),
              SizedBox(width: 15),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    height: style.width * 0.4,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(_stuInfo['name'],
                              style: style.mFontStyle.copyWith(fontSize: 22)),
                          Text(_stuInfo['studentNo'],
                              style: style.mFontStyle.copyWith(fontSize: 20)),
                          Text('班级:${_stuInfo['class']}',
                              style: style.mFontStyle.copyWith(fontSize: 20)),
                        ]),
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text('联系方式:${_stuInfo['phone']}',
                    style: style.mFontStyle.copyWith(fontSize: 20)),
                Text('宿舍地址:泰山区7栋508',
                    style: style.mFontStyle.copyWith(fontSize: 20)),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
