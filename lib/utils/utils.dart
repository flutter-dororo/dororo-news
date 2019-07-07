import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

class Util {
  static Widget wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if(callback != null) callback();
      },
      child: child,
    );
  }

  static Color colorUtil(String hex) {
    return Color(int.parse('0xff' + hex));
  }

  static final Random _random = Random.secure();

  static String CreateCryptoRandomString([int length = 32]) {
    var values = List<int>.generate(length, (i) => _random.nextInt(256));

    return base64Url.encode(values);
  }
}