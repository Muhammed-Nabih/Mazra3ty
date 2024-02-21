import 'package:flutter/material.dart';
import 'package:mazra3ty_app_farmer/src/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:mazra3ty_app_farmer/src/common/widgets/custom_shapes/products/product_cards/product_card_vertical.dart';
import 'package:mazra3ty_app_farmer/src/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Container(
                child: Center(
                  child: Text(
                    'Store Screen',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // // Products
                  // GridView(
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2,
                  //     mainAxisExtent: 288,
                  //   ),
                  // ), // stop in 16 in min 23
                  TProductCardVertical(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
