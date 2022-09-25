import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_news/controllers/news_controller.dart';
import 'package:flutter_getx_news/widgets/home_grid_view.dart';

class NewsScreen extends GetView<NewsController> {
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News MVVM DEMO"),
      ),
      body: controller.obx(
        (data) => HomeGridView(data!),
        onEmpty: const Text("empty"),
        onError: (error) {
          return Text(error.toString());
          print(error.toString());
        },
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
