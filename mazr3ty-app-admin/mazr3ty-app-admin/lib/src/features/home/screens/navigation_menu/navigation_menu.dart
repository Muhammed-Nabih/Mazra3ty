import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../constants/colors.dart';
import '../home_Screen/home_body.dart';
import '../users_screen/users.dart';
import '../users_view/users_view.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(NavigationController());
    final darkMode=isDarkMode(context);

    //Navigation_Menu_Bar
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7,vertical: 3),
        child: ClipRRect(
          child: Obx(
                ()=>BottomNavigationBar(

                   elevation:0 ,
                   currentIndex: controller.selectedIndex.value,
                   onTap: (index)=>controller.selectedIndex.value=index ,
                   backgroundColor: TColors.light,
                   selectedItemColor:darkMode? TColors.primary:TColors.secondary,
                   unselectedItemColor: darkMode?TColors.white:Colors.black54,
                   items: const [
                     BottomNavigationBarItem (icon:Icon(Icons.space_dashboard_rounded,), label: 'Home'),
                     BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded ,), label: 'Graphs'),
                     BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined ,), label: 'Field View'),
                     BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded,), label: 'Users'),
              ],

            ),
          ),
        ),
      ) ,
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    ) ;
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex= 0.obs;
  final screens= [const HomeBody(),Container(color: Colors.purple,),Container(color: Colors.orange,),const UsersScreen()];

}




