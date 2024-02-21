import 'package:flutter/material.dart';
import 'package:mazra3ty_app_admin/src/constants/colors.dart';
import 'package:mazra3ty_app_admin/src/features/home/screens/home_Screen/home_model.dart';
import 'package:mazra3ty_app_admin/src/features/home/screens/home_Screen/side_bar.dart';
import '../../../../constants/text_strings.dart';
import '../../../../helpers/helper_functions.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:dark? TColors.dark:TColors.light,
        drawer:const NavDrawer(),
        appBar: AppBar(
          leading: Builder(
            builder:(context) {
              return IconButton (onPressed: ()=>Scaffold.of(context).openDrawer(),
                  icon:const Icon(Icons.menu), color:dark? TColors.primary:TColors.secondary);
            }
          ),
          title:Text(TTexts.tTopName,style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold,
            color:  dark?TColors.lightContainer:TColors.darkContainer,
          ),),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:dark? TColors.darkContainer:TColors.lightContainer ,),
                child: IconButton(onPressed: (){},icon: Icon (Icons.notifications,color: dark? TColors.primary:TColors.secondary)),
            )
          ],
        ),
        // body: const HomeModel(),
      ),
    );
  }
}


