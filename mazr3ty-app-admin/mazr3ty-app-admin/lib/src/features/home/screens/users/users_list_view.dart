//
// import 'package:flutter/material.dart';
// import 'package:mazra3ty_app_admin/src/features/home/screens/users/user_tile.dart';
//
// import '../../models/user_model.dart';
//
//
//
// class UserListView extends StatelessWidget {
//   final List<UserModel> users;
//
//   const UserListView({super.key, required this.users});
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildBuilderDelegate(
//         childCount: users.length,
//             (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(bottom: 22),
//             child: UserTile(
//               userModel: users[index],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
