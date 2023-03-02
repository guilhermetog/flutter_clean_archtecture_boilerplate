import 'package:flutter/material.dart';

class _ScreenSize {
  double _heightUnit = 0;
  double _widthUnit = 0;
  double paddingTop = 0;

  _ScreenSize(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    _heightUnit = (media.size.height - (media.padding.top * 2)) / 100;
    _widthUnit = media.size.width / 100;
  }

  double height(double percentage) {
    return _heightUnit * percentage;
  }

  double width(double percentage) {
    return _widthUnit * percentage;
  }
}

class ScreenSize extends _ScreenSize {
  ScreenSize._(super.context);
  static ScreenSize? _instance;
  factory ScreenSize(BuildContext context) {
    _instance ??= ScreenSize._(context);
    return _instance!;
  }
}
