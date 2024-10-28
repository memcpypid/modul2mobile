import 'package:get/get.dart';
import 'package:modul2/app/data/models/article.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/webview/bindings/webview_binding.dart';
import '../modules/webview/views/web_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WEB,
      page: () => ArticleDetailWebView(article: Get.arguments),
      binding: ArticleDetailBinding(),
    ),
  ];
}
