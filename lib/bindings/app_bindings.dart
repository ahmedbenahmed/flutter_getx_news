import 'package:get/get.dart';
import 'package:flutter_getx_news/controllers/news_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(() => NewsController());
  }
}
