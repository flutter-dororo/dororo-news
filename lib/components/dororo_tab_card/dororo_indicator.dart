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
  })  : assert(controller != null),
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
        return Container(
          child: Text('中间'),
        );
      case Axis.vertical:
        return Container(
          child: Text('saa'),
        );

      default:
        throw new Exception("Not a valid Axis");
    }
  }
}
