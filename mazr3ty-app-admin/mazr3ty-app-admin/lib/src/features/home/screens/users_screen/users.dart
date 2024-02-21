import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazra3ty_app_admin/src/constants/colors.dart';
import 'package:mazra3ty_app_admin/src/features/home/screens/users_screen/users-card.dart';
import '../../../../helpers/helper_functions.dart';
import '../../../authentication/controllers/getUser/getUser_cubit.dart';
import 'add_user_screen.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen>
    with TickerProviderStateMixin {
  // int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final dark = THelperFunctions.isDarkMode(context);
    return BlocProvider(
      create: (BuildContext context) => GetUserCubit() ,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddUserScreen()));
            },
            icon: Icon(
              Icons.add_circle_rounded,
              color: dark ? TColors.primary : TColors.secondary,
            ),
          ),
          title: Text(
            "All Users",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_search,
                color: dark ? TColors.primary : TColors.secondary,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: dark ? TColors.darkContainer : TColors.lightContainer),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: dark ? TColors.primary : TColors.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelColor: TColors.white,
                  unselectedLabelColor: dark
                      ? TColors.grey.withOpacity(0.6)
                      : TColors.darkContainer,
                  dividerColor: Colors.red,
                  tabs: const [
                    Tab(
                      text: "Admin",
                    ),
                    Tab(
                      text: "Veterinary",
                    ),
                    Tab(
                      text: "Farmer",
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                height: 565,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    UsersCard(
                      role: 'admin',
                    ),
                    UsersCard(
                      role: 'veterinary',
                    ),
                    UsersCard(
                      role: 'farmer',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
