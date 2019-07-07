import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("发现"),
      ),
      child: SafeArea(
        child: Center(
          child: Text(
            "发现"
          ),
        ),
      ),
    );
  }
}