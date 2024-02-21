import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../common_widgets/form/header_widget.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../helpers/helper_functions.dart';
import '../../../../../utils/widgets/custom_snack_bar.dart';
import '../../../../../utils/widgets/custom_validator.dart';
import '../../../controllers/forgot_pass/forgot_pass_cubit.dart';
import '../../../controllers/forgot_pass/forgot_pass_state.dart';
import '../forget_password_otp/otp_screen.dart';

class ForgetPasswordMailScreen extends StatefulWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordMailScreen> createState() =>
      _ForgetPasswordMailScreenState();
}

class _ForgetPasswordMailScreenState extends State<ForgetPasswordMailScreen> {
  final _formKey = GlobalKey<FormState>();
  Timer? timer;
  String? email;
  String pleaseEnterEmail = '';

  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(TSizes.tDefaultSize),
              child: Column(
                children: [
                  const SizedBox(
                    height: TSizes.tDefaultSize * 2,
                  ),
                  const HeaderWidget(
                      image: TImages.tForgetPasswordImage,
                      title: TTexts.tForgetPassword,
                      subTitle:TTexts.tForgetPasswordSubTitle,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      heightBetween: 30.0,
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height:TSizes.tFormHeight,
                  ),
                  BlocConsumer<ForgotPasswordCubit, ForgotPassState>(
                    listener: (BuildContext context, state) {
                      if (state is ForgotPassLoading) {
                        setState(() {
                          timer?.cancel();
                          EasyLoading.show(
                            status: 'loading',
                            maskType: EasyLoadingMaskType.custom,
                          );
                        });
                      } else if (state is ForgotPassSuccess) {
                        setState(() {
                          timer?.cancel();
                          EasyLoading.showSuccess('Done Check email');
                        });
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const OTPScreen(),
                          ),
                        );
                      } else if (state is ForgotPassFailure) {
                        setState(() {
                          timer?.cancel();
                          EasyLoading.showError(state.errorMessage);
                        });
                        showSnackBar(context, state.errorMessage);
                      }
                    },
                    builder: (context, state) => Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            style:TextStyle(color:dark? TColors.buttonDisabled:TColors.buttonSecondary),
                            keyboardType: TextInputType.text,
                            onChanged: (data) {
                              email = data;
                              setState(() {
                                pleaseEnterEmail = '';
                              });
                            },
                            decoration: const InputDecoration(

                              prefixIcon: Icon(Icons.person_outline_outlined),
                              labelText: "Email",
                              hintText: "Email",


                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  pleaseEnterEmail = "Enter your email ";
                                });
                              }
                              return null;
                            },
                          ),
                          Validator(textValue: pleaseEnterEmail),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<ForgotPasswordCubit>(context)
                                      .forgotPassword(
                                    email: email!,
                                  );
                                }
                              },
                              child: const Text(TTexts.tNext),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
