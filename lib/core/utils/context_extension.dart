import 'package:flutter/material.dart';


extension ContextExtension on BuildContext
{
  double get heightSize => MediaQuery.sizeOf(this).height;
  double get widthSize => MediaQuery.sizeOf(this).width;

}