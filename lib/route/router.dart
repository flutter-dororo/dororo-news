import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

/// pages
import 'package:dororo_news/pages/article_page/article_page.dart';
import 'package:dororo_news/pages/find_page/find_page.dart';
import 'package:dororo_news/pages/home_page/home.dart';
import 'package:dororo_news/pages/me_page/me_page.dart';

class DororoRouter extends StatefulWidget {
  @override
  _DororoRouterState createState() => new _DororoRouterState();
}

class _DororoRouterState extends State<DororoRouter>
    with SingleTickerProviderStateMixin {
  List<Widget> _pages = [HomePage(), FindPage(), ArticlePage(), MePage()];

  final _defaultColor = CupertinoColors.black;
  final _activeColor = CupertinoColors.activeGreen;
  int _currentIndex = 0;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(

      tabBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: handleTabChange,
        items: [
          _renderNavigationBar(AntDesign.home, _defaultColor,
              AntDesign.home, _activeColor, '首页', 0),
          _renderNavigationBar(AntDesign.profile, _defaultColor,
              AntDesign.profile, _activeColor, '文章', 1),
          _renderNavigationBar(Entypo.compass, _defaultColor, Entypo.compass,
              _activeColor, '发现', 2),
          _renderNavigationBar(
              Feather.user, _defaultColor, Feather.user, _activeColor, '我的', 3),
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

  BottomNavigationBarItem _renderNavigationBar(
      icon, Color defaultColor, activeIcon, Color activeColor, String title, int idx) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: defaultColor,
      ),
      activeIcon: Icon(
        activeIcon,
        color: activeColor,
      ),
      title: Text(title, style: TextStyle(
        color: _currentIndex == idx ? activeColor : defaultColor
      ),),
    );
  }

  void handleTabChange(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
