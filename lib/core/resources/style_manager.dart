import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle? _getTextStyle( double fontSize,String fontFamily,FontWeight fontWeight,Color color){
  return TextStyle(color: color ,fontFamily: fontFamily,fontWeight: fontWeight,fontSize: fontSize);
}


TextStyle? getRegularStyle({required Color color,required double fontSize}){
  return _getTextStyle(fontSize ,FontConstants.tajawal ,FontWeightManager.regular, color,);
}

TextStyle? getMediumStyle({required Color color,required double fontSize}){
  return _getTextStyle(fontSize,FontConstants.tajawal , FontWeightManager.medium, color,);
}

TextStyle? getBoldStyle({required Color color,required double fontSize}){
  return _getTextStyle(fontSize,FontConstants.tajawal , FontWeightManager.bold, color,);
}