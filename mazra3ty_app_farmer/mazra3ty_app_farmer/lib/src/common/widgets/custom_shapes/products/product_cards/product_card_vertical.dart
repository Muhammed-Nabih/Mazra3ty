import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mazra3ty_app_farmer/src/common/styles/shadows.dart';
import 'package:mazra3ty_app_farmer/src/common/widgets/Icons/t_circler_icon.dart';
import 'package:mazra3ty_app_farmer/src/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:mazra3ty_app_farmer/src/common/widgets/custom_shapes/images/t_rounded_image.dart';
import 'package:mazra3ty_app_farmer/src/common/widgets/custom_shapes/text/product_title_text.dart';
import 'package:mazra3ty_app_farmer/src/constants/colors.dart';
import 'package:mazra3ty_app_farmer/src/constants/image_strings.dart';
import 'package:mazra3ty_app_farmer/src/constants/sizes.dart';
import 'package:mazra3ty_app_farmer/src/utils/helpers/helper_function.dart';
// D:\Web\Node js\Graduation Project\api\mazra3ty_app_farmer\lib\src\common\widgets\Icons\t_circler_icon.dart
import 'package:mazra3ty_app_farmer/src/common/widgets/Icons/t_circler_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    // Container with side padding , color ,edges , radius and shadow
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            SizedBox(height: TSizes.spaceBtwSections),
            //Thumbnail ,Wishlist Button ,Discount Tag
            TRoundedContainer(
              height: 180,
              padding: EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                // Thumbnail Image
                children: [
                  const TRoundedImage(
                      imageUrl: tProductImage2, applyImageRadius: true),
                  // Sale Tag
                  Positioned(
                    top: 0,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.primary.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text("25%",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black)),
                    ),
                  ),
                  // Favorite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: const TCirclerIcon(
                      icon: Icons.favorite,
                      color: Colors.red,
                    ),
                  ) // 11 minuts video number 16
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            // Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: "Tomato", smallSize: true),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text("vegetables",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium),
                      SizedBox(width: TSizes.xs),
                      const Icon(Iconsax.verify5,
                          color: TColors.secondary, size: TSizes.iconXs),
                    ],
                  ),
                  // Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Text(
                        '\$35.5',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: TColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
