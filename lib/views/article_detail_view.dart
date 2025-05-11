import 'package:flutter/material.dart';
import 'package:flutter_article_app/controller/article_controller.dart';
import 'package:get/get.dart';
import '../models/article_model.dart';

class ArticleDetailView extends StatelessWidget {
  final Article? article;
  ArticleDetailView({Key? key, this.article}) : super(key: key);

  final ArticleController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final Article art = article ?? (Get.arguments != null ? Get.arguments['article'] as Article : Article(id: 0, title: 'No Article', body: 'No content'));
    return Scaffold(
      appBar: AppBar(
        title: Text(art.title),
        actions: [
          Obx(() {
            final isFav = controller.isFavorite(art.id);
            return IconButton(
              icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
              tooltip: isFav ? 'Remove from favorites' : 'Add to favorites',
              onPressed: () => controller.toggleFavorite(art.id),
            );
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              art.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              art.body,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            const Center(
              child: Text(
                'Thank you for reading! 😊',
                style: TextStyle(fontSize: 16, color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
