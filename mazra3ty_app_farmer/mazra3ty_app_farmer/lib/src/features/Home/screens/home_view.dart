import 'package:flutter/material.dart';
import 'package:mazra3ty_app_farmer/src/features/home/screens/navigation_menu/navigation_menu.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: NavigationMenu());
  }
}
