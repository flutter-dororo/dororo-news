import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("我的"),
      ),
      child: SafeArea(
        child: Center(
          child: Text(
            "我的"
          ),
        ),
      ),
    );
  }
}