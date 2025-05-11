import 'package:flutter/material.dart';
import '../models/article_model.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;

  const ArticleCard({super.key, required this.article, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(article.title),
        subtitle: Text(
          article.body.length > 50 ? '${article.body.substring(0, 50)}...' : article.body,
        ),
        onTap: onTap,
      ),
    );
  }
}
