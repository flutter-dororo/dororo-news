import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DororoTitle extends StatelessWidget {

  DororoTitle({
    this.title = '暂无数据',
    this.hasRoute = false
  });

  /// 标题
  final String title;

  /// 是否显示更多
  final bool hasRoute;


  @override
  Widget build(BuildContext context) {
    final Widget MoreWidget = hasRoute ? Row(
      mainAxisAlignment: MainAxisAlignment.start,
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        Text('更多', style: TextStyle(
          color: CupertinoColors.black,
          fontSize: ScreenUtil.getInstance().setSp(24),
        ),),
        Icon(CupertinoIcons.right_chevron, size: 18,),
      ],
    ) : Text('');

    return Container(
      margin: EdgeInsets.only(left: 10, bottom: 5, top: 5),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: CupertinoColors.activeGreen, width: 2,),),
      ),
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: TextStyle(
            color: CupertinoColors.black,
            fontWeight: FontWeight.bold,
            fontSize: ScreenUtil.getInstance().setSp(24),
          ),),
          MoreWidget,
        ],
      ),
    );
  }
}
//

