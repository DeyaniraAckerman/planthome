import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive {
  double _width = 0, _height = 0, _diagonal = 0;
  bool _isTablet = false;

  double get width => _width;

  double get height => _height;

  double get diagonal => _diagonal;

  bool get isTablet => _isTablet;

  static Responsive of(BuildContext context) => Responsive(context);

  static init(BuildContext context) {
    MediaQuery.of(context);
  }

  Responsive(BuildContext context) {
    final Size sixe = MediaQuery.of(context).size;
    _width = sixe.width;
    _height = sixe.height;

    // c2 + a2 + b2 => c = sqrt(a2 + b2) do nde a=Ancho y b=Alto
    _diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));

    //Saber si es una tablet
    _isTablet = sixe.shortestSide >= 600;
  }

  double wp(double percent) => _width * percent / 100;

  double hp(double percent) => _height * percent / 100;

  double dp(double percent) => _diagonal * (percent * 0.0012);
}
