import 'package:dororo_news/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {

  Color ThemeColors = CupertinoColors.extraLightBackgroundGray;
  List<String> _titles = [ 'Lv.1', '2', '收藏', '专题', '文档', '书签', '话题', '草稿' ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("个人中心"),
          leading: CupertinoButton(
            child: Icon(
              CupertinoIcons.conversation_bubble,
              size: 32,
              color: CupertinoColors.black,
            ),
            padding: EdgeInsets.zero,
            onPressed: () {
              // Navigator.of(context).pop(false);
            },
          ),
          trailing: CupertinoButton(
            child: Icon(
              CupertinoIcons.settings,
              size: 32,
              color: CupertinoColors.black,
            ),
            padding: EdgeInsets.zero,
            onPressed: () {
              // Navigator.of(context).pop(false);
            },
          ),
        ),
        child: SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  renderHead(),
                  renderGrid(),
                ],
              ),
            )
        )
    );
  }

  Widget renderHead() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: CupertinoColors.lightBackgroundGray
          )
        )
      ),
      child: Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '__Op',
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '男 / 2019年6月加入',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: CupertinoColors.inactiveGray,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '写点什么，更懂你',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: CupertinoColors.inactiveGray,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text('1'),
                            SizedBox(
                              height: 5,
                            ),
                            Text('关注', style: TextStyle(
                                fontSize: 14
                            ),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text('1'),
                            SizedBox(
                              height: 5,
                            ),
                            Text('粉丝', style: TextStyle(
                                fontSize: 14
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 88.0,
                    height: 88.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 1,
                        color: CupertinoColors.lightBackgroundGray,
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/avator.jpg',
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,
                            color: CupertinoColors.lightBackgroundGray),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          print('11111');
                        },
                        child: Text('签到', style: TextStyle(
                            fontSize: 14,
                            color: CupertinoColors.darkBackgroundGray
                        ),),
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget renderGrid() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: CupertinoColors.lightBackgroundGray
          )
        )
      ),
      height: 150,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: _titles.length,
        itemBuilder: (BuildContext context, int index) {
          return getItemContainer(_titles[index]);
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //单个子Widget的水平最大宽度
            maxCrossAxisExtent: 80,
            //水平单个子Widget之间间距
            mainAxisSpacing: 0.0,
            //垂直单个子Widget之间间距
            crossAxisSpacing: 10.0
        ),
      ),
    );
  }

  Widget getItemContainer(String title) {
    return Container(
      child: Column(
        children: <Widget>[
          Icon(
            CupertinoIcons.settings,
            color: CupertinoColors.black,
          ),
          SizedBox(
            height: 10,
          ),
          Text(title, style: TextStyle(
            fontSize: 14,
            color: Colors.black
          ),),
        ],
      ),
    );
  }
}