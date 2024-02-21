import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

/*-- Light & Dark Outlined Button Themes --*/
class TOutlinedButtonTheme{

  TOutlinedButtonTheme._();
  /*-- Light Theme --*/


  static final lightOutlinedButtonTheme =OutlinedButtonThemeData(
    style:OutlinedButton.styleFrom(

      backgroundColor: TColors.lightContainer,
      foregroundColor: TColors.secondary,
      side:const BorderSide(color: TColors.secondary),
      padding:const EdgeInsets.symmetric(vertical: TSizes.tButtonHeight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),)
    ),
  );


  /*-- Dark Theme --*/
  static final darkOutlinedButtonTheme =OutlinedButtonThemeData(
    style:OutlinedButton.styleFrom(
      backgroundColor: TColors.dark,
      foregroundColor: TColors.primary,
      side:const BorderSide(color: TColors.primary),
      padding:const EdgeInsets.symmetric(vertical: TSizes.tButtonHeight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.buttonRadius),)
    ),
  );
}