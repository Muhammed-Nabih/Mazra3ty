import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazra3ty_app_admin/src/features/authentication/screens/forget_password/reset_password/reset_form.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/forgot_pass/forgot_pass_cubit.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(TSizes.tDefaultSize),
              child: const Column(
                children: [
                  ResetPasswordFrom(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
