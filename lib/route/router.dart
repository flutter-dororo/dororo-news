import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

/// pages
import 'package:dororo_news/pages/article_page/article_page.dart';
import 'package:dororo_news/pages/find_page/find_page.dart';
import 'package:dororo_news/pages/home_page/home.dart';
import 'package:dororo_news/pages/me_page/me_page.dart';

/// plugins

class DororoRouter extends StatefulWidget {
  @override
  _DororoRouterState createState() => new _DororoRouterState();
}

class _DororoRouterState extends State<DororoRouter>
    with TickerProviderStateMixin {
  List<Widget> _pages = [HomePage(), ArticlePage(), FindPage(),  MePage()];

  final _defaultColor = CupertinoColors.black;
  final _activeColor = CupertinoColors.black;
  int _currentIndex = 0;
  bool flag = true;

  AnimationController _controller;
  AnimationController _controller1;
  Animation<double> animation;
  Animation<double> animation1;

  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _controller1 = new AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    final CurvedAnimation curve =
        CurvedAnimation(parent: _controller, curve: Curves.linear);
    final CurvedAnimation curve2 =
        CurvedAnimation(parent: _controller1, curve: Curves.linear);

    animation = Tween(begin: 0.75, end: 1.0).animate(curve);
    animation1 = Tween(begin: 0.75, end: 1.0).animate(curve2);

    _controller1
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });

    _controller
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller1.reverse();
        }
      })
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: handleTabChange,
        items: [
          _renderNavigationBar(CupertinoIcons.home, _defaultColor, Ionicons.ios_home,
              _activeColor, '首页', 0),
          _renderNavigationBar(CupertinoIcons.news, _defaultColor,
              CupertinoIcons.news_solid, _activeColor, '文章', 1),
          _renderNavigationBar(CupertinoIcons.heart, _defaultColor, CupertinoIcons.heart_solid,
              _activeColor, '发现', 2),
          _renderNavigationBar(
              CupertinoIcons.person, _defaultColor, CupertinoIcons.person_solid, _activeColor, '我的', 3),
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(
          builder: (context) {
            return _pages[i];
          },
        );
      },
    );
  }

  BottomNavigationBarItem _renderNavigationBar(icon, Color defaultColor,
      activeIcon, Color activeColor, String title, int idx) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: defaultColor,
      ),
      activeIcon: ScaleTransition(
        scale: flag ? animation : animation1,
        child: Icon(
          activeIcon,
          color: activeColor,
        ),
      ),
      title: Text(
        title,
        style:
            TextStyle(color: _currentIndex == idx ? activeColor : defaultColor),
      ),
    );
  }

  void handleTabChange(int value) {
    setState(() {
      _currentIndex = value;
      flag = !flag;
    });

    if (flag) {
      _controller.forward();
    } else {
      _controller1.forward();
    }
  }
}
