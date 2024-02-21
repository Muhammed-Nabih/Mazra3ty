/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mazra3ty_app_admin/src/constants/image_strings.dart';
import 'package:mazra3ty_app_admin/src/constants/sizes.dart';
import 'package:mazra3ty_app_admin/src/constants/text_strings.dart';

import '../../../../../common_widgets/form/header_widget.dart';
import '../forget_password_otp/otp_screen.dart';

class ForgetPasswordPhoneScreen extends StatelessWidget {
  const ForgetPasswordPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children:  [
                const SizedBox(height: tDefaultSize *4,),
                const HeaderWidget(
                    image: tForgetPasswordImage,
                    title: tForgetPassword,
                    subTitle: tForgetPasswordSubTitle,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    heightBetween: 30.0,
                    textAlign:TextAlign.center
                ),
                SizedBox(height: tFormHeight,),
                Form(child: Column(children: [
                  TextFormField(
                    decoration:InputDecoration(
                      label: Text(tPhoneNo),
                      hintText: tPhoneNo,
                      prefixIcon: Icon(Icons.phone_rounded),
                    ) ,
                  ),
                  const SizedBox(height: 20.0,),
                  SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){
                    Get.to(()=>const OTPScreen());
                  }, child: const Text(tNext)))
                ],))

              ],

            ),

          ),
        ),
      ),
    );
  }
}*/