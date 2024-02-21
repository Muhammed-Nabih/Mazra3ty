import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mazra3ty_app_farmer/src/constants/image_strings.dart';
import 'package:mazra3ty_app_farmer/src/features/home/screens/Profile_Screen/profile_Screen.dart';
import 'package:mazra3ty_app_farmer/src/features/home/screens/home_Screen/home_body.dart';
import 'package:mazra3ty_app_farmer/src/features/home/screens/navigation_menu/navigation_menu.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/text_strings.dart';
import '../../../../helpers/helper_functions.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: isDark ? TColors.primary : TColors.secondary),
              currentAccountPicture: SizedBox(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: const Image(image: AssetImage(tProfileImage))),
              ),
              accountName: const Text(
                tProfileHeading,
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: const Text(
                tProfileSubHeading,
                style: TextStyle(color: Colors.white),
              )),
          ListTile(
            title: const Text(ttProfile),
            leading: const Icon(Icons.person),
            onTap: () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const ProfileScreen();
                  }),
                );
              }
            },
          ),
          ListTile(
            title: const Text(tSettings),
            leading: const Icon(Icons.settings),
            onTap: () {
              // {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) {
              //        return const SettingsScreen();
              //     }),
              //   );
              // }
            },
          ),
        ],
      ),
    );
  }
}
