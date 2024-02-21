// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:mazra3ty_app_admin/src/features/home/screens/users_view/overview.dart';
// import '../../../authentication/controllers/getUser/getUser_cubit.dart';
//
//
// class UserView extends StatefulWidget {
//   const UserView({super.key});
//
//   @override
//   State<UserView> createState() => _OverviewState();
// }
//
// class _OverviewState extends State<UserView> {
//   get timer => null;
//
//   @override
//   void initState() {
//     super.initState();
//     EasyLoading.addStatusCallback((status) {
//       if (status == EasyLoadingStatus.dismiss) {
//         timer?.cancel();
//       }
//     });
//     getUsers();
//   }
//
//   Future<void> getUsers() async {
//     await BlocProvider.of<GetUserCubit>(context).getUserByRole();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => GetUserCubit(),
//       child: Scaffold(
//       body: DefaultTabController(
//         length: 1,
//         child: Column(
//           children: [
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   OverView(),
//                   // Add more children if needed
//                 ],
//               ),
//             ),
//           ],
//         ),
//       )
//
//       ),
//
//     );}
//
// }
