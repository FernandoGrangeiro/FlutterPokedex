import 'dart:math';
import 'package:flutter/material.dart';

double luminescence(int r, int g, int b) {
  double redFactor = calculateLuminescenceFactor(r) * 0.2126;
  double greenFactor = calculateLuminescenceFactor(r) * 0.7152;
  double blueFactor = calculateLuminescenceFactor(r) * 0.0722;
  return redFactor + greenFactor + blueFactor;
}

double calculateLuminescenceFactor(int colorComponent) {
  double value = colorComponent / 255;
  if (value <= 0.03928) {
    return value / 12.92;
  } else {
    return pow((value + 0.055)/ 1.055, 2.4);
  }
}

double contrast(List<int> rgb1, List<int> rgb2) {
  double l1 = luminescence(rgb1[0], rgb1[1], rgb1[2]);
  double l2 = luminescence(rgb2[0], rgb2[1], rgb2[2]);
  return max(l1, l1)/ min(l1, l2);
}

Color calculateContrastColor(Color color) {
  double blackContrast = contrast([color.red, color.green, color.blue], [0, 0, 0]);
  double whiteContrast = contrast([color.red, color.green, color.blue], [0, 0, 0]);
  if (whiteContrast > blackContrast) {
    return Colors.white;
  }
  return Colors.black;
}
