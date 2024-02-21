import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../../../helpers/helper_functions.dart';
import 'add_user_screen.dart';

class UpdateUserScreen extends StatelessWidget {
  const UpdateUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon:Icon(Icons.arrow_back_outlined,color:dark? TColors.primary:TColors.secondary ,)),
        title: Text("Edit User", style: Theme.of(context).textTheme.headlineSmall,),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.tDefaultSize),
          child: Column(
            children: [
              // -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage(TImages.tProfileImage))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100), color:dark? TColors.primary:TColors.secondary),
                      child: Icon(LineAwesomeIcons.camera, color:dark? Colors.black:TColors.lightContainer, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(TTexts.tFullName), prefixIcon: Icon(LineAwesomeIcons.user)),
                    ),
                    const SizedBox(height: TSizes.tFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(TTexts.tEmail), prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                    ),
                    const SizedBox(height: TSizes.tFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(TTexts.tPhoneNo), prefixIcon: Icon(LineAwesomeIcons.phone)),
                    ),
                    const SizedBox(height: TSizes.tFormHeight - 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: const Text(TTexts.tPassword),
                        prefixIcon: const Icon(Icons.fingerprint),
                        suffixIcon:
                        IconButton(icon: const Icon(LineAwesomeIcons.eye_slash), onPressed: () {}),
                      ),
                    ),
                    const SizedBox(height: TSizes.tFormHeight),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const UpdateUserScreen()),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:dark? TColors.primary:TColors.secondary,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(TTexts.tEditProfile, style: TextStyle(color: TColors.lightContainer)),
                      ),
                    ),
                    const SizedBox(height: TSizes.tFormHeight),

                    // -- Created Date and Delete Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: TTexts.tJoined,
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: TTexts.tJoinedAt,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: "Delete",
                              titleStyle: const TextStyle(fontSize: 20),
                              content: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                child: Text("Are you sure, you want to Delete?"),
                              ),
                              confirm: Expanded(
                                child: ElevatedButton(
                                  onPressed: () => {},
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, side: BorderSide.none),
                                  child: const Text("Yes"),
                                ),
                              ),
                              cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              elevation: 0,
                              foregroundColor: Colors.red,
                              shape: const StadiumBorder(),
                              side: BorderSide.none),
                          child:  Text(TTexts.tDelete,style: TextStyle(color:dark?TColors.lightContainer:TColors.lightContainer ),),
                        ),
                      ],
                    )

                  ],

                ),

              ),

            ],

          ),

        ),

      ),
    );
  }
}