import 'package:MIS/route/route.dart' as router;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:MIS/assets/style.dart' as style;
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

const Map<TargetPlatform, PageTransitionsBuilder> _defaultBuilders =
    <TargetPlatform, PageTransitionsBuilder>{
  TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //传到所有子页面的路由key，可用于路由跳转
      navigatorKey: router.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: '/', //初始化的时候加载的路由
      onGenerateRoute: router.onGenerateRoute,
      theme: ThemeData(
        primaryColor: style.themeColor,
        accentColor: style.themeColor,
        pageTransitionsTheme: PageTransitionsTheme(builders: _defaultBuilders),
      ),
    );
  }
}
