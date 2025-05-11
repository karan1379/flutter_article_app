import 'package:flutter/material.dart';
import 'package:flutter_article_app/controller/article_controller.dart';
import 'package:flutter_article_app/views/favourites_view.dart';
import 'package:get/get.dart';
import 'views/home_view.dart';
import 'views/article_detail_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Article App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => HomeView()),
        GetPage(name: '/favorites', page: () => FavoritesView()),
        GetPage(
          name: '/detail',
          page: () {
            final args = Get.arguments as Map<String, dynamic>;
            return ArticleDetailView(article: args['article']);
          },
        ),
      ],
    );
  }
}
