import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
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
          child: Icon(Ionicons.ios_notifications_outline, size: 32,color: CupertinoColors.black,),
          padding: EdgeInsets.zero,
          onPressed: () {
            // Navigator.of(context).pop(false);
          },
        ),
        trailing: CupertinoButton(
          child: Icon(CupertinoIcons.book, size: 32,color: CupertinoColors.black, ),
          padding: EdgeInsets.zero,
          onPressed: () {
            // Navigator.of(context).pop(false);
          },
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Text("首页"),
        ),
      ),
    );
  }
}



