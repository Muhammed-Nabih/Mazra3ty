// import 'package:flutter/material.dart';
//
// import '../../models/user_model.dart';
//
// // cached network image
// class UserTile extends StatelessWidget {
//   const UserTile({super.key, required this.userModel});
//
//   final UserModel userModel;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           userModel.name,
//           style: const TextStyle(
//             color: Colors.black87,
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         Text(
//           userModel.email,
//           style: const TextStyle(
//             color: Colors.black87,
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         Text(
//           userModel.createdAt,
//           style: const TextStyle(
//             color: Colors.black87,
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Text(
//           userModel.updatedAt,
//           style: const TextStyle(
//             color: Colors.black87,
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//       ],
//     );
//   }
// }
