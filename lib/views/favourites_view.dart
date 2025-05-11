import 'package:flutter/material.dart';
import 'package:flutter_article_app/controller/article_controller.dart';
import 'package:get/get.dart';
import '../widgets/article_card.dart';

class FavoritesView extends StatelessWidget {
  final ArticleController controller = Get.find();

  FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final favs = controller.favoriteArticles;
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(title: Text('Favorites')),
      body: favs.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No favorites yet.', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Tap the heart icon on an article to add it to your favorites!',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            )
          : ListView.builder(
        itemCount: favs.length,
        itemBuilder: (_, i) {
          final article = favs[i];
          return ArticleCard(
            article: article,
            onTap: () => Get.toNamed('/detail', arguments: {'article': article}),
          );
        },
      ),
    );
  }
}
