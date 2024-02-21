// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
//
// import '../../../../utils/widgets/custom_snack_bar.dart';
// import '../../../authentication/controllers/getUser/getUser_cubit.dart';
// import '../../../authentication/controllers/getUser/getUser_state.dart';
//
// class OverView extends StatefulWidget {
//   const OverView({Key? key}) : super(key: key);
//
//   @override
//   State<OverView> createState() => _OverViewState();
// }
//
// class _OverViewState extends State<OverView> {
//   late Map<String, dynamic> data;
//   late String email;
//   late String name;
//   late String createdAt;
//   late String updatedAt;
//   late Timer? timer;
//
//   @override
//   void initState() {
//     super.initState();
//     EasyLoading.addStatusCallback((status) {
//       if (status == EasyLoadingStatus.dismiss) {
//         timer?.cancel();
//       }
//     });
//     getStatistics();
//   }
//
//   Future<void> getStatistics() async {
//     await BlocProvider.of<GetUserCubit>(context).getUserByRole();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<GetUserCubit, GetUserByRoleState>(
//       listener: (BuildContext context, state) {
//         if (state is GetUserByRoleLoading) {
//           setState(() {
//             timer?.cancel();
//             EasyLoading.show(
//               status: 'loading',
//               maskType: EasyLoadingMaskType.custom,
//             );
//           });
//         } else if (state is GetUserByRoleSuccess) {
//           setState(() {
//             timer?.cancel();
//             EasyLoading.showSuccess('Done');
//             data = state.posts;
//             // Assign values from 'data' to the respective variables
//             email = data['email'];
//             name = data['name'];
//             createdAt = data['createdAt'];
//             updatedAt = data['updatedAt'];
//           });
//         } else if (state is GetUserByRoleFailure) {
//           setState(() {
//             timer?.cancel();
//             EasyLoading.showError(state.errorMessage);
//           });
//           showSnackBar(context, state.errorMessage);
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   height: 300,
//                   margin: const EdgeInsets.all(25),
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: const Color(0xffe0e0e0),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           const Text(
//                             "User",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const Spacer(),
//                           Text(
//                             "$name",
//                             style: const TextStyle(
//                               fontSize: 25,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "$email",
//                                 style: const TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               const SizedBox(height: 3),
//                               Text(
//                                 "$createdAt",
//                                 style: const TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black45,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "$updatedAt",
//                                 style: const TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               const SizedBox(height: 3),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }