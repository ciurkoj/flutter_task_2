import 'package:flutter_task_2/models/article.dart';

class ArticleViewModel {
  final Article article;

  ArticleViewModel({required this.article});

  int? get id {
    return article.id;
  }

  String? get title {
    return article.title;
  }

  String? get summary {
    return article.summary;
  }

  String? get imageUrl {
    return article.imageUrl;
  }

  bool? get favourite => article.favourite;

  set setFavourite(bool i) {
    article.favourite = i;
  }
}
