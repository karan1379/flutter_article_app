import 'package:flutter/material.dart';
import 'package:flutter_article_app/controller/article_controller.dart';
import 'package:flutter_article_app/views/favourites_view.dart';
import 'package:get/get.dart';
import '../views/article_detail_view.dart';
import '../widgets/article_card.dart';

class HomeView extends StatelessWidget {
  final ArticleController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Get.toNamed('/favorites'),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.error.isNotEmpty) {
          return Center(child: Text('Error: ${controller.error}'));
        }
        return RefreshIndicator(
          onRefresh: controller.fetchArticles,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Welcome! 👋', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Browse the latest articles or search for something interesting.', style: TextStyle(color: Colors.grey[700])),
                    const SizedBox(height: 16),
                    TextField(
                      controller: controller.searchController,
                      decoration: InputDecoration(
                        hintText: 'Search articles...',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.blue[50],
                      ),
                      onChanged: controller.search,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.filteredArticles.length,
                  itemBuilder: (_, i) {
                    final article = controller.filteredArticles[i];
                    return ArticleCard(
                      article: article,
                      onTap: () => Get.toNamed('/detail', arguments: {'article': article}),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
