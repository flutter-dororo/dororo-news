import 'dart:math';

import 'package:flutter/cupertino.dart';

enum PageViewIndicatorStyle {
  /// 圆形
  CIRCLE,

  /// 正方形
  SQUARE,

  /// 卡片
  CARD
}

enum PageViewIndicatorAnimStyle {
  NORMAL,
  SCALED,
}

class DororoIndicator extends AnimatedWidget {
  DororoIndicator({
    this.controller,
    this.itemCount: 0,
    this.onPageSelected,
    this.scrollDirection = Axis.horizontal,
    this.normalColor: CupertinoColors.white,
    this.activeColor: CupertinoColors.activeBlue,
    this.size: 8.0,
    this.spacing: 4.0,
    this.scaleSize: 1.4,
    this.style: PageViewIndicatorStyle.CIRCLE,
    this.animStyle: PageViewIndicatorAnimStyle.NORMAL,
  })
      : assert(controller != null),
        super(listenable: controller);

  /// pageView controller [pageView控制器]
  final PageController controller;

  /// indicator [指示器个数]
  final int itemCount;

  /// onPageSelected [点击的事件监听]
  final ValueChanged<int> onPageSelected;

  /// scrollDirection [方向][默认: Axis.horizontal]
  final Axis scrollDirection;

  /// normalColor [普通颜色][默认: CupertinoColors.activeBlue]
  final Color normalColor;

  /// activeColor [激活的颜色][默认: CupertinoColors.white]
  final Color activeColor;

  /// size [指示器的大小][默认: 8.0]
  final double size;

  /// spacing [指示器距离][默认: 4.0]
  final double spacing;

  /// PageViewIndicatorStyle [指示器样式][默认: PageViewIndicatorStyle.circle]
  final PageViewIndicatorStyle style;

  /// PageViewIndicatorAnimStyle [指示器动画样式][默认: PageViewIndicatorAnimStyle.normal]
  final PageViewIndicatorAnimStyle animStyle;

  /// scaleSize [指示器放大的倍数][默认: 1.4]
  final double scaleSize;

  @override
  Widget build(BuildContext context) {
    return _createDororoIndicator(
        scrollDirection, itemCount, size, spacing, animStyle);
  }

  /// * 生成指示器方法 *
  Widget _createDororoIndicator(Axis scrollDirection, int itemCount,
      double size, double spacing, PageViewIndicatorAnimStyle animStyle) {
    switch (scrollDirection) {
      case Axis.horizontal:
        return _createDororoHorizontalIndicator(
            scrollDirection, itemCount, size, spacing,
            animStyle == PageViewIndicatorAnimStyle.SCALED ? scaleSize : 1.0);
      case Axis.vertical:
        return _createDororoVerticalIndicator(
            scrollDirection, itemCount, size, spacing,
            animStyle == PageViewIndicatorAnimStyle.SCALED ? scaleSize : 1.0);

      default:
        throw new Exception("Not a valid Axis");
    }
  }


  /// 生成水平的指示器
  Widget _createDororoHorizontalIndicator(Axis scrollDirection, int itemCount,
      double size, double spacing, double d) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(itemCount, (int index) {
        return _createDororoIndicatorItem(index, itemCount, size, spacing, d);
      })
      ,
    );
  }

  /// 生成垂直的指示器
  Widget _createDororoVerticalIndicator(Axis scrollDirection, int itemCount,
      double size, double spacing, double d) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(itemCount, (int index) {
        return _createDororoIndicatorItem(index, itemCount, size, spacing, d);
      })
      ,
    );
  }

  /// 生成每一个指示器
  Widget _createDororoIndicatorItem(int index, int pageCount, double size,
      double spacing, double maxZoom) {
    ///
    double currentPostion = ((controller.page ??
        controller.initialPage.toDouble()) % pageCount.toDouble());

    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - (currentPostion - index).abs(),
      ),
    );


    bool isCurrentPageSelected = index ==
        (controller.page != null ? controller.page.round() % pageCount : 0);

    if (currentPostion > pageCount - 1 && index == 0) {
      selectedness = 1 - (pageCount.toDouble() - currentPostion);
    }

//    double zoom = 1.0 + (maxZoom - 1.0) * selectdness;

    final ColorTween selectedColorTween =
    ColorTween(begin: normalColor, end: activeColor);


    return GestureDetector(
      onTap: () => onPageSelected(index),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: selectedColorTween.lerp(selectedness),
              )
            ]
        ),
        child: Text(
          '$index', style: TextStyle(color: isCurrentPageSelected ? CupertinoColors.white : CupertinoColors.black),),
      ),
    );
  }
}
