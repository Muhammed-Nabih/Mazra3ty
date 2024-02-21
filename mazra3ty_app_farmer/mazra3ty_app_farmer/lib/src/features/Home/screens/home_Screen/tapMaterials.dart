import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mazra3ty_app_farmer/src/constants/colors.dart';

class Materials extends StatelessWidget {
  const Materials({Key? key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 80,
        color: Colors.transparent,
        child: TabBar(
          isScrollable: true,
          labelPadding: const EdgeInsets.only(left: 10, right: 10),
          physics: const ClampingScrollPhysics(),
          labelColor: Colors.white, // Set labelColor to white
          unselectedLabelColor: TColors.primary,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
            color: TColors.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          tabs: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Tab(
                child: Text(
                  "Overview",
                  style: GoogleFonts.ubuntu(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Tab(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Water Lavel",
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Tab(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Soil Moisture",
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Tab(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Fire",
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Tab(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Water Pump",
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Tab(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Rain Drop",
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
