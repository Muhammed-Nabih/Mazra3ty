import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/colors.dart';
import '../../../../../helpers/helper_functions.dart';
import '../updated_user.dart';
import 'package:intl/intl.dart';

class UsersCardWidget extends StatelessWidget {
  String title, subtitle, datetitle, time;
  String image;

  UsersCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.datetitle,
    required this.time,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: double.maxFinite,
      height: 200,
      decoration: BoxDecoration(
        color: dark ? TColors.primary : TColors.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image as String,
              width: 45,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: dark ? TColors.lightContainer : TColors.lightContainer,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: dark
                          ? TColors.lightContainer
                          : TColors.lightContainer,
                    ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 8.0,
                ),
                decoration: BoxDecoration(
                    color: TColors.lightContainer,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.date_range_outlined,
                      size: 18,
                      color: TColors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6, right: 14),
                      child: Text(
                        datetitle,
                        style: TextStyle(color: TColors.darkerGrey),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.access_time_rounded,
                        size: 18,
                        color: TColors.darkContainer,
                      ),
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(time)),
                      style: const TextStyle(
                        color: TColors.darkContainer,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                      height: 50,
                      width: 90,
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UpdateUserScreen()));
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: TColors.lightContainer,
                            elevation: 0,
                            foregroundColor: TColors.black,
                            side: BorderSide(
                                color:
                                    dark ? TColors.primary : TColors.secondary),
                          ),
                          child: const Text(
                            "Edit",
                            style: TextStyle(
                                color: TColors.darkerGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ))),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                      height: 50,
                      width: 90,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: "Delete",
                              titleStyle: const TextStyle(fontSize: 20),
                              content: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                child:
                                    Text("Are you sure, you want to Delete?"),
                              ),
                              confirm: Expanded(
                                child: ElevatedButton(
                                  onPressed: () => {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent,
                                      side: BorderSide.none),
                                  child: const Text("Yes"),
                                ),
                              ),
                              cancel: OutlinedButton(
                                  onPressed: () => Get.back(),
                                  child: const Text("No")),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              elevation: 0,
                              foregroundColor: Colors.black,
                              shape: const StadiumBorder(),
                              side: BorderSide.none),
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          ))),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
