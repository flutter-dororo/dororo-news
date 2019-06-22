import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DororoRouter extends StatefulWidget {
  @override
  _DororoRouterState createState() => new _DororoRouterState();
}

class _DororoRouterState extends State<DororoRouter> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
            child: Center(
              child: Text('Hello World'),
            )
        )
    );
  }
}
