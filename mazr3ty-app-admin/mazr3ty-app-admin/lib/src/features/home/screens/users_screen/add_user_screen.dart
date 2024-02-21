import 'package:flutter/material.dart';
import 'package:mazra3ty_app_admin/src/common_widgets/form/header_widget.dart';
import 'package:mazra3ty_app_admin/src/constants/image_strings.dart';
import 'package:mazra3ty_app_admin/src/constants/sizes.dart';
import 'package:mazra3ty_app_admin/src/features/home/screens/users_screen/user_screen_widget/adduser_widget.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return SafeArea(
        child: Scaffold(
         body: SingleChildScrollView(
          child: Container(
           padding: const EdgeInsets.all(TSizes.tDefaultSize),
            child:const Column(
             children:  [
               Image(image: const AssetImage(TImages.tAddUser), height:200,),
                AddUser(),
               // Column(
               //   children: [
               //     const Text("OR"),
               //     SizedBox(
               //       width: double.infinity,
               //       child: OutlinedButton.icon(
               //         onPressed: (){},
               //         icon: const Image(image: AssetImage(TImages.tLogInScreenLogo),
               //           width: 20.0,
               //         ),
               //         label:  Text(TTexts.tSignInWithGoogle.toUpperCase()),
               //
               //       ),
               //     ),
               //     TextButton(
               //         onPressed: (){},
               //         child: Text.rich(
               //         TextSpan(
               //           children: [
               //             TextSpan(text: TTexts.tAlreadyHaveAnAccount,style: Theme.of(context).textTheme.bodyMedium),
               //             TextSpan(text: TTexts.tLogin.toUpperCase(),)
               //           ]
               //         ))
               //     )]
               // )
            ],
          ),
        ),
        
      ),
        ),
    );
    }
  }



