import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flustars/flustars.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_marquee/flutter_marquee.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<String> bannerList = [
    'http://www.qidianlife.com/Singular/Public/Uploads/2016-09-13/57d8000c916ed.jpg',
    'http://www.qidianlife.com/Singular/Public/Uploads/2019-03-30/5c9eec385777c.png',
    'http://www.qidianlife.com/Singular/Public/Uploads/2019-02-26/5c7546a73750b.png',
    'http://www.qidianlife.com/Singular/Public/Uploads/2019-02-16/5c66e23880cf1.jpg',
    'http://www.qidianlife.com/Singular/Public/Uploads/2018-11-07/5be1d478b6d06.png',
    'http://www.qidianlife.com/Singular/Public/Uploads/2017-07-02/59589fd7a9af1.png',
    'http://www.qidianlife.com/Singular/Public/Uploads/2016-09-13/57d8000c916ed.jpg',
    'http://www.qidianlife.com/Singular/Public/Uploads/2019-03-30/5c9eec385777c.png'
  ];

  final List<String> myTabs = [
    '最新', //listType是参数值
    'Web前端',
    'Java',
    '产品经理',
  ];

  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: myTabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(context);
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "多多罗新闻",
          style: TextStyle(
              fontFamily: 'zzgf',
              letterSpacing: 1,
              fontSize: 28,
              fontWeight: FontWeight.w400),
        ),
        leading: CupertinoButton(
          child: Icon(
            Ionicons.ios_notifications_outline,
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
            CupertinoIcons.book,
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
        left: false,
        right: false,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Container(
                child: renderPageView,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 页面包在listView里面
  Widget get renderPageView {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        renderBanner,
        renderTopNav,
        renderDuoDuoNewsHot,
        renderTabCard,
        renderTabView,
      ],
    );
  }

  // 轮播图
  Widget get renderBanner {
    return Container(
      decoration: BoxDecoration(color: CupertinoColors.white),
      height: 180,
      padding: EdgeInsets.only(top: 8),
      child: Swiper(
        pagination: SwiperPagination(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 130),
          builder: DotSwiperPaginationBuilder(
            size: 6,
            space: 6,
            activeColor: CupertinoColors.white,
            color: CupertinoColors.white,
          ),
        ),
        autoplay: true,
        itemCount: bannerList.length,
        scale: 0.95,
        viewportFraction: 0.9,
        itemBuilder: (BuildContext context, idx) {
          return GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                child: FadeInImage.assetNetwork(
                  image: bannerList[idx],
                  placeholder: 'assets/images/loading_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // 顶部导航
  Widget get renderTopNav {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          border: Border(
            bottom: BorderSide(
                width: 0.5,
                style: BorderStyle.solid,
                color: CupertinoColors.lightBackgroundGray),
          )),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Icon(
                    CupertinoIcons.pencil,
                    color: CupertinoColors.black,
                  ),
                ),
                Text(
                  '热门文章',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Icon(
                    CupertinoIcons.bookmark,
                    color: CupertinoColors.black,
                  ),
                ),
                Text(
                  '全部课程',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Icon(
                    CupertinoIcons.photo_camera,
                    color: CupertinoColors.black,
                  ),
                ),
                Text(
                  '设计专栏',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 热点新闻
  Widget get renderDuoDuoNewsHot {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(color: CupertinoColors.white),
      child: Row(
        children: <Widget>[
          Text(
            "多多头条",
            style: TextStyle(
              fontFamily: 'zzgf',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: FlutterMarquee(
              children: <Widget>[
                Text("[头条] 知乎专栏粉丝突破1个人啦!",
                    style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.darkBackgroundGray)),
                Text("[文章] 程序是怎样跑起来的?",
                    style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.darkBackgroundGray)),
                Text("[新闻] 《多多罗新闻》App上线啦!",
                    style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.darkBackgroundGray)),
                Text("[新闻] 《多多罗新闻小程序》上线啦！",
                    style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.darkBackgroundGray)),
              ],
              onChange: (i) {
                print(i);
              },
              duration: 5,
            ),
          ),
        ],
      ),
    );
  }

  // tab选项卡
  Widget get renderTabCard {
    double width = ScreenUtil.screenWidthDp;
    print(width);
    return Container(
        margin: EdgeInsets.only(top: 5),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TabBar(
              controller: tabController,
              isScrollable: true,
              labelColor: Colors.black,
              labelPadding: EdgeInsets.all(5),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                    color: CupertinoColors.black, width: 1.5),
                insets: EdgeInsets.only(bottom: 10, right: ScreenUtil.getInstance().setWidth(38), left: ScreenUtil.getInstance().setWidth(38)),
              ),
              tabs: myTabs.map((tab) {
                return Container(
                  width: (width - 70) / myTabs.length,
                  child: Tab(text: tab,),
                );
              }).toList(),
            ),
            Spacer(flex: 2,),
            Container(
              child: Icon(
                  Entypo.chevron_small_down
              ),
            )
          ],
        )
    );
  }

  // tabView - 1
  Widget get renderTabView {
    return Container(
      height: 600,
      child: TabBarView(
        controller: tabController,
        children: _renderTabViewList(),
      ),
    );
  }

  // tabView
  List<Widget> _renderTabViewList() {
    return myTabs.map((tab) {
      return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 10 / 8,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(10),
        children: _buildTabViewChildItems(myTabs.length, myTabs),
      );
    }).toList();
  }

  _buildTabViewChildItems(int length, List<String> myTabs) {
    return List.generate(length, (idx) {
      return Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 100,
                color: Colors.grey[300],
                child: FadeInImage.assetNetwork(
                  image: bannerList[idx],
                  placeholder: 'assets/images/loading_logo.png',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 5,),
                      Icon(SimpleLineIcons.eye, color: Colors.white, size: 12,),
                      SizedBox(width: 5,),
                      Text('99999',
                        style: TextStyle(color: Colors.white, fontSize: 12),)
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 5),
            child: Text(
              '${myTabs[idx]} - 标题 $idx 中文标题太长了, 中文标题太长了, 中文标题太长了, 中文标题太长了',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: CupertinoColors.black,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      );
    });
  }
}


