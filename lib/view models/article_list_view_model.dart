import 'package:flutter/material.dart';
import 'package:flutter_task_2/models/article.dart';
import 'package:flutter_task_2/services/web_service.dart';

import 'article_view_model.dart';

class ArticleListViewModel extends ChangeNotifier {
  List<ArticleViewModel> articles = [];
  List<ArticleViewModel> favArticles = [];

  Future<List<ArticleViewModel>> fetchArticles() async {
    List<Article>? results = await Webservice().fetchArticles();
    articles = results!.map((item) => ArticleViewModel(article: item)).toList();
    notifyListeners();
    return articles;
  }

  setFavourite(ArticleViewModel article) {
    favArticles.add(article);
    notifyListeners();
  }

  removeFavourite(ArticleViewModel article) {
    favArticles.removeWhere((element) => element.id == article.id);
    notifyListeners();
  }
}
