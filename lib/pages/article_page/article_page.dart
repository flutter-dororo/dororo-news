import 'package:flutter/material.dart';
import 'package:underline_indicator/underline_indicator.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage>
    with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.black,
                    labelPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    indicator: UnderlineIndicator(
                      borderSide: BorderSide(color: Color(0xff2fcfbb), width: 3),
                      insets: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                    ),
                    tabs: [
                      Tab(text: '111'),
                      Tab(text: '222'),
                      Tab(text: '333'),
                    ]),
              ),
              Flexible(
                child: TabBarView(
                    controller: _tabController,
                    children: [
                      Text('1111'),
                      Text('2222'),
                      Text('3333'),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}