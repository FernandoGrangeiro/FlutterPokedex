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
    pow((value + 0.055)/ 1.055, 2.4);
  }
}
