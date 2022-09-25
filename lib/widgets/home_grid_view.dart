import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_news/screens/news_detail_screen.dart';

import '../model/news_model.dart';
import 'home_cached_network_image.dart';

class HomeGridView extends StatelessWidget {
  final List<NewsArticle> listNews;

  const HomeGridView(this.listNews);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        var data = listNews[index];
        return GestureDetector(
          onTap: () {
            Get.to(NewsDetailScreen(data));
          },
          child: GridTile(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: HomeCachedNetworkImage(data),
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                data.title!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
      itemCount: listNews.length,
    );
  }
}
