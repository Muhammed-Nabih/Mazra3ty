import 'package:flutter/material.dart';
import 'package:mazra3ty_app_farmer/src/constants/colors.dart';
import 'package:mazra3ty_app_farmer/src/constants/sizes.dart';
import 'package:mazra3ty_app_farmer/src/utils/helpers/helper_function.dart';

class TCirclerIcon extends StatelessWidget {
  const TCirclerIcon({
    super.key,
    // required this.dark,
    required this.icon,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  // final bool dark;
  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : THelperFunction.isDarkMode(context)
                ? TColors.black.withOpacity(0.9)
                : TColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
