import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage>
    with SingleTickerProviderStateMixin {

  List<String> data = [
    "选一个好的背景让你的设计更出彩！",
    "Android开发未来的出路何在？|技术头条",
    "一款对Toast，Snackbar，Dialog进行优化与兼容封装的开源库",
    "考拉Android客户端路由总线设计",
    "Google费尽心力推出了一个新的项目架构",
    "带你解决WebView里的常见问题",
    "为什么说它对 Android 未来的发展十分重要？",
    "Android高阶转场动画完全攻略",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ArticleListView
      ),
    );
  }


  Widget get ArticleListView {
    return ListView(
      children: <Widget>[
        // 图片
        Container(
          child: Image.network(
            "http://www.qidianlife.com/Singular/Public/Uploads/2019-03-30/5c9eec385777c.png",
            fit: BoxFit.fill,
            height: 120.0,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 12.5,bottom: 12.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Ionicons.ios_flame),
                  const Text("本周最热")
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Ionicons.ios_trophy),
                  const Text("贡献榜")
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Ionicons.ios_funnel),
                  const Text("文章榜")
                ],
              ),
            ],
          ),
        ),
        Container(
          color: Color(0xfff4f4f4),
          padding: EdgeInsets.all(5.0),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Image.asset(
            "assets/images/article_defalut_item.png",
            height: 25.0,
          ),
        ),
        // Container(
        //   child: _ArticleChildItems(data.length, data),
        // )
        Column(children: _ArticleChildItems(data.length, data),)
      ],
    );
  }


  _ArticleChildItems(int length, List<String> data){
    return List<Widget>.generate(length, (idx){
      return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            _articleChildItemUserView("https://avatars0.githubusercontent.com/u/12776443?s=460&v=4", "Jason", "GitHub", "一周前"),
            _articleChildItemData(data[idx], 9999, 10, 1)
          ],
        ),
      );
    });
  }

// https://avatars0.githubusercontent.com/u/12776443?s=460&v=4
  _articleChildItemUserView(String headPortrait ,String name, String type, String pubDate){
    return Row(
      children: <Widget>[
        Container(
          height: 36.0,
          width: 36.0,
          child: ClipOval(
            child: Image.network(headPortrait),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "$name",
                style: TextStyle(
                    fontSize: 14.0
                ),
              ),
              Text(
                "# $type   $pubDate",
                style: TextStyle(
                  fontSize: 11.0,
                  color: Color(0xFFc8c8c8),
                ),
              ),
            ],
          ),
        )

      ],
    );
  }

  _articleChildItemData(String title,int readCount,int commentsCount,int likeCount){
    return Container(
      color: Color(0xfff4f4f4),
      height: 90.0,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top:10.0,bottom: 10.0),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.0
                    )
                ),
                Text(
                  "阅读 $readCount · 评论 $commentsCount · 喜欢 $likeCount",
                  style: TextStyle(
                      color: Color(0xFFc8c8c8),
                      fontSize: 11.0
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Image(
              image: NetworkImage("http://www.qidianlife.com/Singular/Public/Uploads/2019-03-30/5c9eec385777c.png"),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],

      ),

    );
  }


}