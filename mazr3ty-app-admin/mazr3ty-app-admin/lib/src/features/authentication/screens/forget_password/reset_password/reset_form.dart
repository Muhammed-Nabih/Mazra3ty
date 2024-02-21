import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mazra3ty_app_admin/src/features/authentication/screens/login/login_screen.dart';
import '../../../../../common_widgets/form/header_widget.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../helpers/helper_functions.dart';


class ResetPasswordFrom extends StatefulWidget {
  const ResetPasswordFrom({Key? key}) : super(key: key);


  @override
  State<ResetPasswordFrom> createState() => _ResetPasswordForm();


}

  class _ResetPasswordForm extends State<ResetPasswordFrom> {
    final _formKey = GlobalKey<FormState>();
    bool? check = false;
    bool isHidden = true;
    String pleaseEnterPhone = '';
    String pleaseEnterPassword = '';
    Timer? timer;
    late double progress;

    void togglePasswordView() {
      setState(() {
        isHidden = !isHidden;
      });
    }
    @override
    void initState() {
      super.initState();
      EasyLoading.addStatusCallback((status) {
        if (status == EasyLoadingStatus.dismiss) {
          timer?.cancel();
        }
      });
    }

    GlobalKey<FormState> formKey = GlobalKey();
    bool isLoading = false;
    String? password;
    dynamic phone, email, containerEmailOrPhone;
    Widget? loading;


    @override
    Widget build(BuildContext context) {
      final dark=THelperFunctions.isDarkMode(context);
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(TSizes.tDefaultSize),
              child: Column(
                children: [
                  const SizedBox(height: TSizes.tDefaultSize * 0.5),
                  HeaderWidget(
                    image: TImages.tForgetPasswordImage,
                    title: TTexts.tResetPassword.toUpperCase(),
                    subTitle: TTexts.tResetPasswordSubTitle,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    heightBetween: 30.0,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height:TSizes.tFormHeight),
                  Form(
                    child: Column(
                      children: [
                        const SizedBox(height: TSizes.tFormHeight-20),
                        TextFormField(

                          style:TextStyle(color:dark? TColors.buttonDisabled:TColors.buttonSecondary),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isHidden,
                          onChanged: (data) {
                            password = data;
                            setState(() {
                              pleaseEnterPassword = '';
                            });
                          },
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_clock_sharp),
                            labelText: TTexts.tNewPassword,
                            hintText: TTexts.tNewPassword,
                            suffixIcon: IconButton(
                              onPressed: togglePasswordView,
                              icon: isHidden
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              setState(() {
                                pleaseEnterPassword =
                                'Please enter your password';
                              });
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: TSizes.tFormHeight-20),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isHidden,
                          onChanged: (data) {
                            password = data;
                            setState(() {
                              pleaseEnterPassword = '';
                            });
                          },
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_clock_sharp),
                            labelText: TTexts.tNewConfirmPassword,
                            hintText: TTexts.tNewConfirmPassword,
                            suffixIcon: IconButton(
                              onPressed: togglePasswordView,
                              icon: isHidden
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              setState(() {
                                pleaseEnterPassword =
                                'Please enter your password';
                              });
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  Get.to(() => const LoginScreen());
                                },
                                child: const Text(TTexts.tNext))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    }

