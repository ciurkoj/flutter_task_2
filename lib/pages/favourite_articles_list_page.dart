import 'package:flutter/material.dart';
import 'package:flutter_task_2/view%20models/article_list_view_model.dart';
import 'package:flutter_task_2/view%20models/article_view_model.dart';
import 'package:flutter_task_2/widgets/article_list.dart';
import 'package:provider/provider.dart';

class FavouriteArticleListPage extends StatefulWidget {
  const FavouriteArticleListPage({Key? key}) : super(key: key);

  @override
  _FavouriteArticleListPageState createState() =>
      _FavouriteArticleListPageState();
}

class _FavouriteArticleListPageState extends State<FavouriteArticleListPage> {
  late ArticleListViewModel articleListViewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    articleListViewModel = Provider.of<ArticleListViewModel>(context);
    List<ArticleViewModel>  favArticles = articleListViewModel.favArticles;
    return Wrap(
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ChangeNotifierProvider<ArticleListViewModel>.value(
                value: articleListViewModel,
                builder: (context, e) {
                  return Column(children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Expanded(
                        child: ArticlesList(articles: favArticles))
                  ]);
                })),
      ],
    );
  }
}
