import 'package:flutter/material.dart';

class Dimensions {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }

  static double fontSize(double size) {
    return (size / screenHeight) * screenHeight;
  }

  static double height(double inputHeight) {
    return (inputHeight / screenHeight) * screenHeight;
  }

  static double width(double inputWidth) {
    return (inputWidth / screenWidth) * screenWidth;
  }

  static double size(double inputSize) {
    return (inputSize / screenHeight) * screenHeight;
  }
}
