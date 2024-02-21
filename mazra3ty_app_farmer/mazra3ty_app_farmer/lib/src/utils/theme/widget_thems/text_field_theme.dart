import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TTextFormFieldTheme{
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme=

         InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
            prefixIconColor: TColors.secondary,
            floatingLabelStyle:const TextStyle(color: TColors.secondary),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
            borderSide:const BorderSide (width: 2, color: TColors.secondary),
  )); // OutlineInputBorder, InputDecorationTheme


  static InputDecorationTheme darkInputDecorationTheme=

   InputDecorationTheme(

      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      prefixIconColor: TColors.primary,
      floatingLabelStyle:const TextStyle(color: TColors.primary),

      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide (width: 2, color: TColors.primary),
      ));


}