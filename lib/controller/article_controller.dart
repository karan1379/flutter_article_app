import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../models/article_model.dart';

class ArticleController extends GetxController {
  var articles = <Article>[].obs;
  var filteredArticles = <Article>[].obs;
  var favorites = <int>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  Future<void> fetchArticles() async {
    try {
      isLoading(true);
      error('');
      final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        final data = response.data as List;
        articles.value = data.map((e) => Article.fromJson(e)).toList();
        filteredArticles.assignAll(articles);
        loadFavorites();
      } else {
        error('Failed to load articles');
      }
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void search(String query) {
    if (query.isEmpty) {
      filteredArticles.assignAll(articles);
    } else {
      filteredArticles.assignAll(articles.where((a) =>
      a.title.toLowerCase().contains(query.toLowerCase()) ||
          a.body.toLowerCase().contains(query.toLowerCase())));
    }
  }

  void toggleFavorite(int id) async {
    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favorites', favorites.map((e) => e.toString()).toList());
  }

  bool isFavorite(int id) => favorites.contains(id);

  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList('favorites');
    favorites.value = stored?.map(int.parse).toList() ?? [];
  }

  List<Article> get favoriteArticles =>
      articles.where((a) => favorites.contains(a.id)).toList();
}
