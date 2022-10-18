import 'dart:convert';

import 'package:flutter_task_2/models/article.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<Article>?> fetchArticles() async {
    String url = "https://api.spaceflightnewsapi.net/v3/articles";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)
          .map<Article>((movie) => Article.fromJson(movie))
          .toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
