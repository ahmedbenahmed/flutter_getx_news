import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/news_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsArticle? article;

  static String routeName = '/news_details';

  const NewsDetailScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 150),
              child: Column(
                children: [
                  Text(
                    "Author",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(this.article?.author ?? 'Undefined')
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.article!.title!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 3,
                ),
              ),
              Text(
                this.article!.publishedAt!,
              ),
              Container(
                  height: 200,
                  child: CachedNetworkImage(
                    imageUrl: this.article!.urlToImage == null
                        ? ""
                        : this.article!.urlToImage!,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)),
                      );
                    },
                    placeholder: (context, url) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container();
                    },
                  )),
              SizedBox(
                height: 30,
              ),
              Text("Description"),
              Text(
                this.article!.description!,
                style: TextStyle(
                  fontSize: 16,
                  wordSpacing: 3,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                this.article!.content!,
                style: TextStyle(
                  fontSize: 16,
                  wordSpacing: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
