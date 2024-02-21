import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mazra3ty_app_farmer/src/features/Home/screens/home_view.dart';
import 'package:mazra3ty_app_farmer/src/features/home/screens/profile_screen/profile_widget/profile_menu_widget.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../../../helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          // i want on pressed go backto home page
          onPressed: () {
            // Navigate to another page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
            );
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: isDark ? TColors.primary : TColors.secondary,
          ),
        ),
        title: Text(tProfile,
            style: TextStyle(
                color:
                    isDark ? TColors.lightContainer : TColors.darkContainer)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon,
                color: isDark ? TColors.primary : TColors.secondary,
              ))
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.tDefaultSize),
          child: Column(
            children: [
              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage(tProfileImage))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: dark ? TColors.primary : TColors.secondary),
                      child: Icon(
                        LineAwesomeIcons.alternate_pencil,
                        color: isDark
                            ? TColors.darkContainer
                            : TColors.lightContainer,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              Text(tProfileHeading,
                  style: TextStyle(
                    color: isDark ? TColors.lightContainer : TColors.darkerGrey,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  )),
              Text(tProfileSubHeading,
                  style: TextStyle(
                    color: isDark ? Colors.white60 : Colors.black54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(height: 30),

              /// -- BUTTON
              // SizedBox(
              //   width: 200,
              //   child: ElevatedButton(
              //     onPressed: () => Get.to(() => const UpdateProfileScreen()),
              //     style: ElevatedButton.styleFrom(
              //         backgroundColor: TColors.tAppListColor, side: BorderSide.none, shape: const StadiumBorder()),
              //     child: const Text(TTexts.tEditProfile, style: TextStyle(color:TColors.dark)),
              //   ),
              // ),
              // const SizedBox(height: 30),
              // const Divider(),
              // const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(
                  title: "Settings",
                  textColor:
                      isDark ? TColors.lightContainer : TColors.darkContainer,
                  icon: Icons.settings,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Help",
                  textColor:
                      isDark ? TColors.lightContainer : TColors.darkContainer,
                  icon: Icons.help_outline_outlined,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "User Management",
                  textColor:
                      isDark ? TColors.lightContainer : TColors.darkContainer,
                  icon: LineAwesomeIcons.user_check,
                  onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Information",
                  textColor:
                      isDark ? TColors.lightContainer : TColors.darkContainer,
                  icon: LineAwesomeIcons.info,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Get.defaultDialog(
                      title: "LOGOUT",
                      titleStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "Are you sure, you want to Logout?",
                          style: TextStyle(color: TColors.secondary),
                        ),
                      ),
                      confirm: Expanded(
                        child: ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              side: BorderSide.none),
                          child: const Text("Yes"),
                        ),
                      ),
                      cancel: OutlinedButton(
                        onPressed: () => Get.back(),
                        child: const Text("No"),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
