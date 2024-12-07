import 'package:equalizer_visualization/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AppText {
  static Text titleLarge(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: Dimensions.fontSize(36),
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  // Other text styles can be added here

  static Text subTitleLarge(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: Dimensions.fontSize(16),
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }

  // Other text styles can be added here
}
