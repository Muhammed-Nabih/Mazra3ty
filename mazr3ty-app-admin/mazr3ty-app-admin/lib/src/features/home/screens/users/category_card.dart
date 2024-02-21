// import 'package:flutter/material.dart';
// import '../../models/category_model.dart';
// import '../users_view/category_view.dart';
//
// class CategoryCard extends StatelessWidget {
//   const CategoryCard({super.key, required this.category});
//
//   final CategoryModel category;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) {
//               return CategoryView(
//                 category: category.categoryName,
//               );
//             },
//           ),
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(right: 16),
//         child: Container(
//           height: 85,
//           width: 160,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Center(
//             child: Text(
//               category.categoryName,
//               style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
