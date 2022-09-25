import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../model/news_model.dart';

class HomeCachedNetworkImage extends StatelessWidget {
  final NewsArticle data;

  const HomeCachedNetworkImage(this.data);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: data.urlToImage == null ? "" : this.data.urlToImage!,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        );
      },
      placeholder: (context, url) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) {
        return Center(
          child: Icon(Icons.error),
        );
      },
    );
  }
}
