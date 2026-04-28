import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponsiveHelper {

  static double width(BuildContext context) => MediaQuery.of(context).size.width;
  static double height(BuildContext context) => MediaQuery.of(context).size.height;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
          MediaQuery.of(context).size.width < 900;

  static bool isLargeTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900 &&
          MediaQuery.of(context).size.width < 1300;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1300;
}



