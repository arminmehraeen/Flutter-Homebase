import 'package:flutter/cupertino.dart';

extension NumExtensions on num {

  /// Returns a SizedBox widget with the specified height.
  ///
  /// Example usage:
  /// ```
  /// final box = 100.height; // Creates a SizedBox with height 100.0
  /// ```
  SizedBox get height => SizedBox(height: toDouble());

  /// Returns a SizedBox widget with the specified width.
  ///
  /// Example usage:
  /// ```
  /// final box = 150.width; // Creates a SizedBox with width 150.0
  /// ```
  SizedBox get width => SizedBox(width: toDouble());

}