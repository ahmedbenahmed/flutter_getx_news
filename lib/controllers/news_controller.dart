import 'package:get/get.dart';

import '../model/news_model.dart';
import '../service/api_provider.dart';

class NewsController extends GetxController with StateMixin<List<NewsArticle>> {
  ApiProvider _apiProvider = ApiProvider();
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    _apiProvider.fetchTopHeadlines().then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
