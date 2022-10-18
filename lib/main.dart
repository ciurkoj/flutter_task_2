import 'package:flutter/material.dart';
import 'package:flutter_task_2/pages/articles_list_page.dart';
import 'package:flutter_task_2/pages/favourite_articles_list_page.dart';
import 'package:flutter_task_2/view%20models/article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider<ArticleListViewModel>.value
        ChangeNotifierProvider<ArticleListViewModel>.value(
            value: ArticleListViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  ArticleListViewModel vm = ArticleListViewModel();
  final List<Widget> pages = [
    const ArticleListPage(),
    const FavouriteArticleListPage(),
  ];

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Favuorites',
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        children: pages,
        index: _selectedIndex,
      ),
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
    );
  }
}
