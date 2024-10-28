import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul2/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article View'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.httpController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.articles.isEmpty) {
          return const Center(child: Text('No articles found.'));
        }

        return ListView.builder(
          itemCount: controller.articles.length,
          itemBuilder: (context, index) {
            final article = controller.articles[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (article.urlToImage != null)
                    Image.network(
                      article.urlToImage!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ListTile(
                    title: Text(article.title,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (article.author != null)
                          Text('Author: ${article.author}'),
                        if (article.description != null)
                          Text(article.description!,
                              maxLines: 2, overflow: TextOverflow.ellipsis),
                        if (article.publishedAt != null)
                          Text(
                              'Published at: ${article.publishedAt.toLocal().toString().split(' ')[0]}'),
                      ],
                    ),
                    isThreeLine: true,
                    onTap: () {
                      Get.toNamed(Routes.WEB,
                          arguments:
                              "https://techcrunch.com/2024/05/08/bye-bye-bots-alteras-game-playing-ai-agents-get-backing-from-eric-schmidt/");
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
