import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../../../utils/widgets/custom_snack_bar.dart';
import '../../../../utils/widgets/custom_validator.dart';
import '../../../Home/screens/home_view.dart';
import '../../controllers/login/login_cubit.dart';
import '../../controllers/login/login_state.dart';
import '../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (BuildContext context, state) {
        if (state is LoginLoading) {
          setState(() {
            timer?.cancel();
            EasyLoading.show(
              status: 'loading',
              maskType: EasyLoadingMaskType.custom,
            );
          });
        } else if (state is LoginSuccess) {
          setState(() {
            timer?.cancel();
            EasyLoading.showSuccess('تم الدخول بنجاح');
          });
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.topToBottom,
              child: const HomeView(),
            ),
          );
        } else if (state is LoginFailure) {
          setState(() {
            timer?.cancel();
            EasyLoading.showError(state.errorMessage);
          });
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) => Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: TSizes.tFormHeight - 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (data) {
                    containerEmailOrPhone = data;
                    setState(() {
                      pleaseEnterPhone = '';
                    });
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: tEmail,
                    hintText: tEmail,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        pleaseEnterPhone = "Enter your email or phone";
                      });
                    }
                    return null;
                  },
                ),
                Validator(textValue: pleaseEnterPhone),

                const SizedBox(
                  height: TSizes.tFormHeight,
                ),
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
                    labelText: tPassword,
                    hintText: tPassword,
                    border: const OutlineInputBorder(),
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
                        pleaseEnterPassword = 'Please enter your password';
                      });
                    }
                    return null;
                  },
                ),
                Validator(textValue: pleaseEnterPassword),
                const SizedBox(height: TSizes.tFormHeight - 10),
                //--Forget Password BTN

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      ForgetPasswordScreen.buildShowModalBottomSheet(context);
                    },
                    child: const Text(tForgetPassword),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final formattedPhoneNumber =
                            formatPhoneNumber(containerEmailOrPhone);
                        if (formattedPhoneNumber) {
                          BlocProvider.of<LoginCubit>(context).login(
                            phone: containerEmailOrPhone!,
                            password: password!,
                          );
                        } else {
                          BlocProvider.of<LoginCubit>(context).login(
                            email: containerEmailOrPhone!,
                            password: password!,
                          );
                        }
                      }
                    },
                    child: Text(tLogin.toUpperCase()),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

bool formatPhoneNumber(String phoneNumber) {
  final regex = RegExp(r'^(\d{3})(\d{4})(\d{4})$');
  final match = regex.firstMatch(phoneNumber);
  if (match != null) {
    return true;
  } else {
    return false;
  }
}
