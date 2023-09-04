import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yalla_go/core/resources/style_manager.dart';
import 'package:yalla_go/core/resources/values_manager.dart';


import 'color_manager.dart';
import 'font_manager.dart';

ThemeData myTheme(BuildContext context){
  return ThemeData(
      primaryColor: ColorManager.primary,
      scaffoldBackgroundColor: ColorManager.white,


      appBarTheme:  Theme.of(context).appBarTheme.copyWith(
          elevation: 0,
          color:  ColorManager.white ,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness:Brightness.light
          )
      ),


    iconTheme: IconThemeData(
      color: ColorManager.silver
    ),

    textTheme: TextTheme(
        titleMedium: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s24),
        bodySmall: getRegularStyle( fontSize: FontSize.s12, color: ColorManager.black),
        bodyMedium: getMediumStyle(color: ColorManager.black, fontSize: FontSize.s16),
        bodyLarge: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s18)
    ),

    cardTheme: CardTheme(

        elevation: AppSize.s1_5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s1),
        ),
        color: ColorManager.white

    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.buttonColor,
            disabledBackgroundColor: ColorManager.silver,
            shape:  const StadiumBorder()
        )
    ),

    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),buttonColor: ColorManager.primary,
        disabledColor: ColorManager.silver
    ),







  );

}