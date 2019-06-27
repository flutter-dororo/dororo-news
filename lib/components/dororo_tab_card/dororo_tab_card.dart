import 'package:dororo_news/components/dororo_tab_card/dororo_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

/// * 自定义实现一个pageView *
///
/// * 类似网页端的tab选项卡 *
/// example: https://element.eleme.io/#/zh-CN/component/tabs
///

class DororoPageView extends StatelessWidget {
  ///  data[内容数据]
  final List data;

  /// customViewPageItemWidget[自定义内容样式]
  final List<Widget> customViewPageItemWidget;

  /// autoScrollDurationSeconds[自动滑动时间][单位: s][默认: 5]
  final int autoScrollDurationSeconds;

  /// onPageTap[点击事件监听]
  final ValueChanged<int> onPageTap;

  /// height[pageView高度][默认: 150]
  final double height;

  /// pageViewScrollDirection[pageView滑动方向][水平/垂直][默认: 水平]
  final Axis pageViewScrollDirection;

  /// pageViewMargin[pageView之间间距][默认：10]
  final EdgeInsetsGeometry pageViewMargin;

  /// pageViewBorderRadius[pageView圆角][默认: 10]
  final BorderRadius pageViewBorderRadius;

  /// pageViewDefaultBGColor[pageView颜色][默认: gary]
  final Color pageViewDefaultBGColor;

  /// pageViewIndicatorIsOutside[指示器是否在外部][默认: false]
  final bool pageViewIndicatorIsOutside;

  /// pageViewIndicatorAlignment[pageView对应的选项卡位置][默认: center]
  final Alignment pageViewIndicatorAlignment;

  /// pageViewIndicatorPadding[pageView对应的选项卡padding值][默认: [l: 15, r: 15, t: 5, b: 5]]
  final EdgeInsetsGeometry pageViewIndicatorPadding;

  /// pageViewItemTextColor[pageViewItem字体颜色][默认: white]
  final Color pageViewItemTextColor;

  /// pageViewItemBGColor[pageViItem背景颜色][默认: 黑色]
  final Color pageViewItemBGColor;

  /// indicatorPositioned[指示器位置][默认: [t: 10]]
  final Positioned indicatorPositioned;

  /// indicatorScrollDirection[指示器方向][水平/垂直][默认: 水平]
  final Axis indicatorScrollDirection;

  /// indicatorNormalColor[指示器原始颜色][默认: white]
  final Color indicatorNormalColor;

  /// indicatorActiveColor[指示器激活颜色][默认: blue]
  final Color indicatorActiveColor;

  /// indicatorNormalSize[指示器大小][默认: 8.0]
  final double indicatorNormalSize;

  /// indicatorScaleSize[指示器放大倍数][默认: 1.4]
  final double indicatorScaleSize;

  /// indicatorSpacing[指示器间距][默认: 4.0]
  final double indicatorSpacing;

  /// indicatorStyle[指示器样式][
  ///   PageViewIndicatorStyle.CIRCLE /
  ///   PageViewIndicatorStyle.SQUARE /
  ///   PageViewIndicatorStyle.CARD
  /// ]
  /// [默认: PageViewIndicatorStyle.CIRCLE]
  final PageViewIndicatorStyle indicatorStyle;

  /// indicatorAnimStyle[指示器动画样式][
  ///   PageViewIndicatorAnimStyle.NORMAL /
  ///   PageViewIndicatorAnimStyle.SCALED
  /// ][默认: PageViewIndicatorAnimStyle.NORMAL]
  final PageViewIndicatorAnimStyle indicatorAnimStyle;

  DororoPageView(
      {@required this.data,
      this.customViewPageItemWidget,
      this.autoScrollDurationSeconds: 5,
      this.onPageTap,
      this.height: 150,
      this.pageViewScrollDirection: Axis.horizontal,
      this.pageViewMargin: const EdgeInsets.all(10),
      this.pageViewBorderRadius: const BorderRadius.all(Radius.circular(10)),
      this.pageViewDefaultBGColor: CupertinoColors.darkBackgroundGray,
      this.pageViewIndicatorAlignment: Alignment.center,
      this.pageViewIndicatorIsOutside: false,
      this.pageViewIndicatorPadding:
          const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      this.pageViewItemTextColor: CupertinoColors.white,
      this.pageViewItemBGColor: CupertinoColors.black,
      this.indicatorPositioned: const Positioned(top: 10.0),
      this.indicatorScrollDirection: Axis.horizontal,
      this.indicatorNormalColor: CupertinoColors.white,
      this.indicatorActiveColor: CupertinoColors.activeBlue,
      this.indicatorNormalSize: 8.0,
      this.indicatorScaleSize: 1.4,
      this.indicatorSpacing: 4.0,
      this.indicatorStyle: PageViewIndicatorStyle.CIRCLE,
      this.indicatorAnimStyle: PageViewIndicatorAnimStyle.NORMAL});

  /// 轮播控制器
  Timer _timer;

  /// 控制器
  final PageController _pageController = PageController(initialPage: 200);

  /// 获取数据的真实长度
  int _getReallyPageViewSize() {
    return data != null ? data.length : 0;
  }

  /// 触摸的时候,将轮播控制器状态清空
  _resetTimer() {
    if (_timer != null) {
      _timer.cancel();
    }

    _timer = Timer.periodic(Duration(seconds: autoScrollDurationSeconds),
        (Timer timer) {
      if (_pageController.page != null) {
        var nextPageIndex = _pageController.page.toInt() + 1;
        _toPage(nextPageIndex);
      }
    });
  }

  /// 跳转到pageView
  void _toPage(int pageIndex) {
    _pageController.animateToPage(page,
        duration: Duration(microseconds: 300), curve: Curves.ease);
  }


  ///


  @override
  Widget build(BuildContext context) {
    _resetTimer();
    return Container(
      child: Text('111'),
    );
  }
}
