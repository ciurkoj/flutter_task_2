import 'package:flutter/material.dart';
import 'package:flutter_task_2/view%20models/article_list_view_model.dart';
import 'package:flutter_task_2/view%20models/article_view_model.dart';
import 'package:provider/provider.dart';

class ArticlesList extends StatefulWidget {
  final List<ArticleViewModel>? articles;

  const ArticlesList({Key? key, this.articles}) : super(key: key);

  @override
  _ArticlesListState createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  List<ArticleViewModel>? articles;

  late ArticleListViewModel articleListViewModel;

  @override
  void initState() {
    super.initState();
    articles = widget.articles;
  }

  @override
  Widget build(BuildContext context) {
    articleListViewModel = Provider.of<ArticleListViewModel>(context);

    if (articles!.isEmpty) articles = widget.articles;
    return ListView.builder(
      itemCount: articles?.length,
      padding: const EdgeInsets.only(bottom: 50),
      itemBuilder: (context, index) {
        final article = articles?[index];

        return Column(
          children: [
            Container(
              color: Colors.black12,
              height: 10,
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Wrap(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Icon(Icons.close)),
                              ],
                            ),
                            Column(
                              children: [
                                if (article?.imageUrl != null)
                                  Image.network(article!.imageUrl!),
                                Text(article?.title ?? "",
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                Text(article?.summary ?? "")
                              ],
                            )
                          ],
                        ),
                      );
                    });
              },
              contentPadding: const EdgeInsets.all(20),
              leading: Container(
                decoration: BoxDecoration(
                    image: article?.imageUrl != null
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(article!.imageUrl!))
                        : null,
                    borderRadius: BorderRadius.circular(6)),
                width: 50,
                height: 150,
              ),
              trailing: TextButton(
                  onPressed: () {
                    if (article!.favourite == true) {
                      setState(() {
                        articleListViewModel.removeFavourite(article);
                        article.setFavourite = article.favourite == null
                            ? true
                            : !article.favourite!;
                      });
                    } else {
                      setState(() {
                        article.setFavourite = article.favourite == null
                            ? true
                            : !article.favourite!;
                        articleListViewModel.setFavourite(article);
                      });
                    }
                  },
                  child: Icon(
                      article!.favourite == true
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red)),
              title: Text(article.title ?? "no title"),
            ),
          ],
        );
      },
    );
  }
}
