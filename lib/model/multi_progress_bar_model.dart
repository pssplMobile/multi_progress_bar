import 'package:flutter/material.dart';

class ProgressItem {
  /// [title] will be used for legends
  String? title;

  /// [progress] can't be greater than 1.
  /// For example 20 % should be mentioned as 0.2
  double progress;

  /// [progressColor] used to draw the color of the bar.
  Color progressColor;

  ProgressItem({
    this.title,
    required this.progress,
    required this.progressColor,
  });
}
