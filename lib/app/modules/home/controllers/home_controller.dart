import 'package:get/get.dart';
import '../../../data/services/http_controller.dart';
import '../../../data/models/article.dart';

class HomeController extends GetxController {
  final HttpController httpController = HttpController();

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  void fetchArticles() async {
    await httpController.fetchArticles();
  }

  List<Article> get articles => httpController.articles;
}
