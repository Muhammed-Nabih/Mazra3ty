import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mazra3ty_app_admin/src/features/home/screens/users_screen/user_screen_widget/user_card_widget.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../utils/widgets/custom_snack_bar.dart';
import '../../../authentication/controllers/getUser/getUser_cubit.dart';
import '../../../authentication/controllers/getUser/getUser_state.dart';

class UsersCard extends StatefulWidget {
  @override
  State<UsersCard> createState() => _UsersCardState();
  final String role;
  const UsersCard({super.key, required this.role});
}

class _UsersCardState extends State<UsersCard> {
  late Timer? timer;
  dynamic usersByRole;
  @override
  void initState() {
    usersByRole = [];
    super.initState();
    getUsers();
    print('from UI WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW ${widget.role}');
  }

  Future<void> getUsers() async {
    await BlocProvider.of<GetUserCubit>(context)
        .getUserByRole(role: widget.role);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserCubit, GetUserByRoleState>(
        listener: (BuildContext context, state) {
      if (state is GetUserByRoleLoading) {
        setState(() {
          timer?.cancel();
          EasyLoading.show(
            status: 'loading',
            maskType: EasyLoadingMaskType.custom,
          );
        });
      } else if (state is GetUserByRoleSuccess) {
        setState(() {
          usersByRole = state.posts;
        });
      } else if (state is GetUserByRoleFailure) {
        setState(() {
          timer?.cancel();
          EasyLoading.showError(state.errorMessage);
        });
        showSnackBar(context, state.errorMessage);
      }
    }, builder: (context, state) {
      return ListView.builder(
          // the number of items in the list
          itemCount: usersByRole.length,

          // display each item of the product list
          itemBuilder: (context, index) {
            return Column(
              children: [
                UsersCardWidget(
                  title: usersByRole[index]['name'],
                  image: TImages.tProfileImage,
                  subtitle: "Admin\t-\tDoctor",
                  time:  usersByRole[index]['createdAt'],
                  datetitle: 'Sunday',
                ),
                const SizedBox(height: TSizes.tFormHeight - 20),
              ],
            );
          });
    });
  }
}
