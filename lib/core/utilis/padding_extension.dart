import 'package:flutter/material.dart';

extension PaddingExtension on Widget {

  Widget allPadding(double padding) {
    return Padding(
        padding:EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget horizontalPadding(double padding) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  Widget verticalPadding(double padding) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }
}