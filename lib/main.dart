import 'package:dororo_news/route/router.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(DororoNews());

class DororoNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: DororoRouter(),
    );
  }
}
