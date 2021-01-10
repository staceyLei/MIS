import 'package:flutter/material.dart';
import 'package:MIS/pages/container/Tab/Tabs.dart';
import 'package:MIS/pages/container/SearchPage/SearchPage.dart';

final routes = {
  '/': (context, {arguments}) => Tabs(),
  '/SearchPage': (context, {arguments}) => SearchPage(),
};

// 代表当前context的路由对象
final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  print('route ${settings.name}');
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      print('arguments:${settings.arguments}');
      final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments),
      );
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
