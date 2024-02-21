//
// import 'package:flutter/material.dart';
// import 'package:mazra3ty_app_admin/src/features/home/screens/users/users_list_view.dart';
//
// import '../../models/user_model.dart';
//
// class UserListViewBuilder extends StatefulWidget {
//   const UserListViewBuilder({super.key, required this.category});
//
//   final String category;
//   @override
//   State<UserListViewBuilder> createState() => _NewsListViewBuilderState();
// }
//
// class _NewsListViewBuilderState extends State<UserListViewBuilder> {
//   var future;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // future = ;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<UserModel>>(
//         future: future,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return UserListView(
//               users: snapshot.data!,
//             );
//           } else if (snapshot.hasError) {
//             return const SliverToBoxAdapter(
//               child: Text('oops  was an error, try later'),
//             );
//           } else {
//             return const SliverToBoxAdapter(
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//         });
//   }
// }
