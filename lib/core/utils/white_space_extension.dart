import 'package:flutter/cupertino.dart';

extension WhiteSpaceExtension on num{

  SizedBox get widthSpace => SizedBox(width: toDouble(),);
  SizedBox get heightSpace => SizedBox(height: toDouble(),);
}