import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("文章"),
      ),
      child: SafeArea(
        child: Center(
          child: Text(
            "文章"
          ),
        ),
      ),
    );
  }
}