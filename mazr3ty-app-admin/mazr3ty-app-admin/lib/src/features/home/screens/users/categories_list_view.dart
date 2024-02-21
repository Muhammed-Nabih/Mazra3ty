// import 'package:flutter/material.dart';
// import '../../models/category_model.dart';
// import 'category_card.dart';
//
//
//
// class CategoriesListView extends StatelessWidget {
//   const CategoriesListView({
//     super.key,
//   });
//
//   final List<CategoryModel> categories = const [
//     CategoryModel(
//       categoryName: 'admin',
//     ),
//     CategoryModel(
//       categoryName: 'farmer',
//     ),
//     CategoryModel(
//       categoryName: 'veterinary',
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 85,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: categories.length,
//           itemBuilder: (context, index) {
//             return CategoryCard(
//               category: categories[index],
//             );
//           }),
//     );
//   }
// }
