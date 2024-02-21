import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../utils/widgets/custom_snack_bar.dart';
import '../../../controllers/forgot_pass/forgot_pass_cubit.dart';
import '../../../controllers/forgot_pass/forgot_pass_state.dart';
import '../last-step-change-password/change-password.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: Scaffold(
        body: BlocConsumer<ForgotPasswordCubit, ForgotPassState>(
          listener: (BuildContext context, state) {
            if (state is OtpForgotPassLoading) {
              setState(() {
                timer?.cancel();
                EasyLoading.show(
                  status: 'loading',
                  maskType: EasyLoadingMaskType.custom,
                );
              });
            } else if (state is OtpForgotPassSuccess) {
              setState(() {
                timer?.cancel();
                EasyLoading.showSuccess('Done');
              });

              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.bottomToTop,
                  child: const ChangePassword(),
                ),
              );
            } else if (state is OtpForgotPassFailure) {
              setState(() {
                timer?.cancel();
                EasyLoading.showError(state.errorMessage);
              });
              showSnackBar(context, state.errorMessage);
            }
          },
          builder: (context, state) => Container(
            padding: const EdgeInsets.all(TSizes.tDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tOtpTitle,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 70.0,
                  ),
                ),
                Text(
                  tOtpSubTitle.toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 40.0),
                const Text(
                  "$tOtpMessege support@codingwitht.com",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  numberOfFields: 6,
                  keyboardType: TextInputType.text,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  onSubmit: (code) =>
                      BlocProvider.of<ForgotPasswordCubit>(context)
                          .sendOtp(otp: code),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
