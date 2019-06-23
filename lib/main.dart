import 'package:dororo_news/route/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(DororoNews());

class DororoNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          primaryColor: CupertinoColors.activeGreen,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: DororoRouter(),
    );
  }
}
