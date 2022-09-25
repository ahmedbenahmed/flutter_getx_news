import 'package:get/get.dart';
import 'package:flutter_getx_news/screens/news_detail_screen.dart';
import 'package:flutter_getx_news/screens/news_screen.dart';

class RouteManager {
  static List<GetPage> routes = [
    GetPage(name: NewsScreen.routeName, page: () => NewsScreen()),
//    GetPage(name: NewsDetailScreen.routeName, page: () => NewsDetailScreen()),
  ];
}
