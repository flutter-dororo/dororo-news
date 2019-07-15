/**
 *
 *  参考：
 *    https://ant.design/docs/spec/font-cn
 *
 *  为了界面统一, 美观进行一波ui颜色字体的规范
 *
 *
 *  font:
 *    公共的样式(如果其他的有size默认是用其他的):
 *      size: 14sp
 *      lineHeight: 22.0
 *
 *  color:
 *
 *    Title:
 *      black85: Color(0xFF262626)
 *      size: 24sp
 *      lineHeight: 32.0
 *
 *    PrimaryText:
 *      black65: Color(0xFF95A59)
 *
 *    SecondaryText
 *      black45: Color(0xFF8C8D8C)
 *
 *    Disable
 *      black25: Color(0xFFBFC0BF)
 *
 *    Border
 *      black15: Color(0xFFD9DAD9)
 *
 *    Dividers
 *      black9: Color(0xFFE8E9E8)
 *
 *    Background:
 *      black4: Color(0xFFF5F6F5)
 *
 *    TableHeader:
 *      black2: Color(0xFFFAFBFA)
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 主色
const Color _primaryColor = Color(0xFF95A59);

/// 禁用的颜色
const Color _primaryColorDisabled = Color(0xFFBFC0BF);

/// 默认的背景色
const Color _defaultBackgroundColor = Color(0xFFF5F6F5);

/// 默认的边框色
const Color _defaultBorderColor = Color(0xFFD9DAD9);


final _defaultTheme = DororoTheme();

class DororoTheme {
  /// 主色
  final Color primaryColor;

  /// 主色禁用
  final Color primaryColorDisabled;

  /// 默认背景色
  final Color defaultBackgroundColor;

  /// 默认边框色
  final Color defaultBorderColor;

  DororoTheme({
    this.primaryColor = _primaryColor,
    this.primaryColorDisabled = _primaryColorDisabled,
    this.defaultBackgroundColor = _defaultBackgroundColor,
    this.defaultBorderColor = _defaultBorderColor,
  });
}

class DororoThemeData extends InheritedWidget {
  final DororoTheme theme;

  DororoThemeData({
    Key key,
    this.theme,
    Widget child,
  }) : super(key: key, child: child);


  static DororoThemeData of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(DororoThemeData);
  }

  static DororoTheme getTheme(BuildContext context) {
    final DororoThemeData dororoTheme = DororoThemeData.of(context);
    return dororoTheme == null || dororoTheme.theme == null ? _defaultTheme : dororoTheme.theme;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

}