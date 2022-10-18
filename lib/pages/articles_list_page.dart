import 'package:flutter/material.dart';
import 'package:flutter_task_2/view%20models/article_list_view_model.dart';
import 'package:flutter_task_2/widgets/article_list.dart';
import 'package:provider/provider.dart';

class ArticleListPage extends StatefulWidget {
  const ArticleListPage({Key? key}) : super(key: key);

  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  ArticleListViewModel? articleListViewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (articleListViewModel == null) {
      articleListViewModel = Provider.of<ArticleListViewModel>(context);
      articleListViewModel?.fetchArticles().then((value) {
        articleListViewModel!.articles = value;
      });
    }

    return Wrap(
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Expanded(
                  child: RefreshIndicator(
                      onRefresh: articleListViewModel!.fetchArticles,
                      child: ArticlesList(
                          articles: articleListViewModel?.articles)))
            ])),
      ],
    );
  }
}
