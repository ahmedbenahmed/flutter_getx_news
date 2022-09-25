import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_news/screens/news_screen.dart';

import 'bindings/app_bindings.dart';
import 'utils/routes_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News APP',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfffefdfd),
        appBarTheme: AppBarTheme(
          color: Colors.blue,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          toolbarTextStyle: TextTheme(
            headline6:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ).bodyText2,
          titleTextStyle: TextTheme(
            headline6:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ).headline6,
        ),
      ),
      initialRoute: NewsScreen.routeName,
      getPages: RouteManager.routes,
      initialBinding: AppBinding(),
    );
  }
}
