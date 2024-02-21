
import 'package:flutter/material.dart';
import 'package:mazra3ty_app_admin/src/features/authentication/screens/login/login_screen.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;


    return Scaffold(
      backgroundColor: isDarkMode ? TColors.dark : TColors.light,
      body: Container(
        padding: const EdgeInsets.all(TSizes.tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: const AssetImage(TImages.tWelcomeScreenImage), height: height * 0.34),
            Column(
              children: [
                Text(TTexts.tWelcomeTitle, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: TSizes.spaceBtwItems,),
                Text(TTexts.tWelcomeSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                    },
                    child: Text(TTexts.tWelcomeButton.toUpperCase()),
                  ),
                ),
                const SizedBox(width: 10.0),
              ],
            )
          ],
        ),
      ),
    );
  }
}