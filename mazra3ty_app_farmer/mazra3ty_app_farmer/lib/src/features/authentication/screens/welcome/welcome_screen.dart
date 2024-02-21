import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazra3ty_app_farmer/src/features/authentication/screens/login/login_screen.dart';
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
      backgroundColor: isDarkMode ? TColors.secondary : TColors.white,
      body: Container(
        padding: const EdgeInsets.all(TSizes.tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: const AssetImage(tWelcomeScreenImage), height: height * 0.3),
            Column(
              children: [
                Text(tWelcomeTitle, style: Theme.of(context).textTheme.displayMedium),
                Text(tWelcomeSubTitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () =>Get.to(()=>const LoginScreen()),
                    child: Text(tLogin.toUpperCase()),
                  ),
                ),
                const SizedBox(width: 7.0),

              ],
            )




                //-------------------------------------------------
                /*const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: ()  =>Get.to(()=>const SignUpScreen()),
                    child: Text(tSignup.toUpperCase()),
                  ),
                ),*/
                //------------------------------------------------




          ],
        ),
      ),
    );
  }
}