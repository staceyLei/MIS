import 'package:flutter/material.dart';
import 'package:MIS/assets/style.dart' as style;

class Item extends StatelessWidget {
  final Map item;
  Item({this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          //带参数的路由跳转
          Navigator.pushNamed(context, '/StudentDetail',
              arguments: {"stuInfo": item});
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(color: Colors.white, border: style.borderS),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                // decoration: BoxDecoration(
                //     borderRadius: style.baseRadius,
                //     image: DecorationImage(
                //         image: AssetImage(item['img']), fit: BoxFit.cover)
                //         ),
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.grey[300],
                ),
                width: 70,
                height: 70,
              ),
              SizedBox(width: 10),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 75,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${item['name']} (${item['studentNo']})',
                              style: style.baseFontStyle
                                  .copyWith(fontSize: style.mFontSize)),
                          Text('联系方式:${item['phone']}',
                              style: TextStyle(
                                  color: style.lightGrey,
                                  fontSize: style.baseFontSize)),
                          Text('班级:${item['class']}',
                              style: TextStyle(
                                  color: style.lightGrey,
                                  fontSize: style.baseFontSize)),
                        ]),
                  )),
            ],
          ),
        ));
  }
}
