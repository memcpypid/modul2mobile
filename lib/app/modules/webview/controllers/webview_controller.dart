import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailController extends GetxController {
  WebViewController? _webViewController;

  @override
  void onInit() {
    super.onInit();
    // Jika Anda ingin melakukan sesuatu saat controller diinisialisasi
  }

  @override
  void onReady() {
    super.onReady();
    // Jika Anda ingin melakukan sesuatu saat controller siap digunakan
  }

  @override
  void onClose() {
    // Bersihkan resources jika perlu
    super.onClose();
  }

  void setWebViewController(WebViewController controller) {
    _webViewController = controller;
  }

  WebViewController? get webViewController => _webViewController;
}
