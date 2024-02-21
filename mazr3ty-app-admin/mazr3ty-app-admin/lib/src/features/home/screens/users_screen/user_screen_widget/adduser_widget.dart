import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazra3ty_app_admin/src/constants/colors.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../helpers/helper_functions.dart';
import '../../../controllers/create_user/api_create_user.dart';
import '../../../models/user_model.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUser> {
  late String userName;
  late String userPhone;
  late String userEmail;
  late String userPassword;
  late String userConfirmPassword;
  late String userRole;
  final addUserScreen = GlobalKey<ScaffoldState>();
  List <String> roles = ["admin", "doctor", "farmer"];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: TSizes.tFormHeight - 20),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              style: TextStyle(
                  color:
                      dark ? TColors.buttonDisabled : TColors.buttonSecondary),
              decoration: const InputDecoration(
                label: Text(TTexts.tFullName),
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
              onChanged: (value) {
                setState(() {
                  userName = value;
                });
              },
            ),
            const SizedBox(height: TSizes.tFormHeight - 20),
            TextFormField(
              style: TextStyle(
                  color:
                      dark ? TColors.buttonDisabled : TColors.buttonSecondary),
              decoration: const InputDecoration(
                label: Text(TTexts.tPhoneNo),
                prefixIcon: Icon(Icons.phone_rounded),
              ),
              onChanged: (value) {
                setState(() {
                  userPhone = value;
                });
              },
            ),
            const SizedBox(height: TSizes.tFormHeight - 20),
            TextFormField(
              style: TextStyle(
                  color:
                      dark ? TColors.buttonDisabled : TColors.buttonSecondary),
              decoration: const InputDecoration(
                label: Text(TTexts.tEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              onChanged: (value) {
                setState(() {
                  userEmail = value;
                });
              },
            ),
            const SizedBox(height: TSizes.tFormHeight - 20),
            TextFormField(
              style: TextStyle(
                  color:
                      dark ? TColors.buttonDisabled : TColors.buttonSecondary),
              decoration: const InputDecoration(
                label: Text(TTexts.tPassword),
                prefixIcon: Icon(Icons.lock_clock_sharp),
              ),
              onChanged: (value) {
                setState(() {
                  userPassword = value;
                });
              },
            ),
            const SizedBox(height: TSizes.tFormHeight - 20),
            TextFormField(
              style: TextStyle(
                  color:
                      dark ? TColors.buttonDisabled : TColors.buttonSecondary),
              decoration: const InputDecoration(
                label: Text(TTexts.tConfirmPassword),
                prefixIcon: Icon(Icons.lock_clock_sharp),
              ),
              onChanged: (value) {
                setState(() {
                  userConfirmPassword = value;
                });
              },
            ),
            const SizedBox(height: TSizes.tFormHeight - 20),
            // SizedBox(
            //   child: Column(
            //     children: [
            //
            //       FormHelper.dropDownWidget(
            //           context,
            //           "Select Role",
            //           this._roles,
            //           this.roles,
            //           (onChangedval){
            //             this._roles=onChangedval;
            //             print("Selected Role:$onChangedval");
            //             userRole=onChangedval;
            //           },
            //           (onValidateVal){
            //             if(onValidateVal==null){
            //               return'Please Select Role';
            //             }
            //             return null;
            //           },
            //           borderColor:dark? Colors.white60:Colors.black54,
            //           borderFocusColor:dark? TColors.primary:TColors.secondary,
            //           borderRadius: 20,
            //           borderWidth: double.infinity,
            //           optionValue:"id" ,
            //           optionLabel: "label" ,
            //           paddingLeft: 3,
            //           paddingRight: 3,
            //
            //       )
            //     ],
            //
            //   ),
            //
            // ),
            // TextFormField(
            //   style: TextStyle(color:dark? TColors.buttonDisabled:TColors.buttonSecondary),
            //   decoration: const InputDecoration(
            //     label: Text('Set Role'),
            //     prefixIcon: Icon(Icons.admin_panel_settings),
            //   ),
            //   onChanged: (value) {
            //     setState(() {
            //       userRole = value;
            //     });
            //   },
            // ),

            SizedBox(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    label: const Text("Role"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                    )),
                items: roles.map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                                fontSize: 20,
                                color: dark ? TColors.grey : TColors.darkGrey),
                          ),
                        ))
                    .toList(),
                onChanged: (item) => setState(() => userRole = item!),
              ),
            ),

            const SizedBox(height: TSizes.tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Add'),
                onPressed: () async {
                  try {
                    UserModel newUser = await API.createUser(
                      userName,
                      userPhone,
                      userEmail,
                      userPassword,
                      userConfirmPassword,
                      userRole,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'New user with name $userName has been created'),
                      ),
                    );
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
