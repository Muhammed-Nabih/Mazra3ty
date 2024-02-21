import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mazra3ty_app_farmer/src/constants/colors.dart';
import 'package:mazra3ty_app_farmer/src/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.height,
    this.width,
    this.child,
    this.padding,
    this.margin,
    this.shadowBorder = false,
    this.radius = TSizes.cardRadiusLg,
    this.backgroundColor = TColors.white,
    this.borderColor = TColors.borderPrimary,
  });

  final double? height;
  final double? width;
  final double radius;
  final Widget? child;
  final bool shadowBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: shadowBorder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}
