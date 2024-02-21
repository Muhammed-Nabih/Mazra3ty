import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazra3ty_app_admin/src/constants/text_strings.dart';

import '../../../../../constants/sizes.dart';
import '../forget_password_mail/forget_password_mail.dart';
import 'forget_password_btn_widget.dart';


/*class ForgetPasswordScreen {

 static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      builder: (context) =>
          Container(
            padding: const EdgeInsets.all(TSizes.tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TTexts.tForgetPasswordTitle, style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium,),

                Text(TTexts.tForgetPasswordSubTitle, style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge,),
                const SizedBox(height: 15.0,),
                ForgetPasswordBtnWidget(
                  onTap: () {
                    Navigator.pop(context);
                    Get.to(()=>const ForgetPasswordMailScreen());},
                  btnIcon: Icons.mail_outline_outlined,
                  title: TTexts.tEmail,
                  subTitle: TTexts.tResetViaEmail,


                ),
                /*const SizedBox(height: 15.0,),
                ForgetPasswordBtnWidget(
                  onTap: () {
                    Navigator.pop(context);
                    Get.to(()=>const ForgetPasswordPhoneScreen());
                  },
                  btnIcon: Icons.mobile_friendly_rounded,
                  title: tPhoneNo,
                  subTitle: tResetViaPhone,*/
              ],
            ),
          ),
    );
  }
}*/






