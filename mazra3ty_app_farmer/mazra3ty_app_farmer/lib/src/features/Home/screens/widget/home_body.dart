import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  // List<String> tabs = ["Overview", "Corn", "Wheat", "Barley"]; // tabs
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Material(
                child: Container(
                  height: 80,
                  color: Colors.transparent,
                  child: TabBar(
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.only(left: 10, right: 10 , top: 10 , bottom: 10),
                    unselectedLabelColor: Colors.orange,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Overview",
                              style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Corn",
                              style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                           
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Wheat",
                              style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Barley",
                              style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView( // tab bar view
                  children: [
                    
                    Container(
                      child: Center(
                        child: Text("Overview"),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text("Corn"),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text("Wheat"),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text("Barley"),
                      ),
                    ),
                  ],
                ),
                )
            
          ],
        ),
      ),
    );
  }
}



// Done
/*
class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<String> tabs = ["Overview", "Corn", "Wheat", "Barley"]; // tabs
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Material(
              
              color: Colors.transparent,
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.transparent,
                labelStyle: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: GoogleFonts.ubuntu(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                tabs: [
                  Tab(text: tabs[0]),
                  Tab(text: tabs[1]),
                  Tab(text: tabs[2]),
                  Tab(text: tabs[3]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/



















/* 
class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
*/

/*
class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<String> tabs = ["Overview", "Corn", "Wheat", "Barley"]; // tabs
  int currentIndex = 0; // index bar
  double changePositionOfLine(){
    switch (currentIndex) {
      case 0:
        return 0;
      case 1:
        return 78;
      case 2:
        return 192;
      case 3:
        return 263;
      default:
        return 0;
    }
  }

  double changeContainerWidth(){
    switch (currentIndex) {
      case 0:
        return 50;
      case 1:
        return 80;
      case 2:
        return 50;
      case 3:
        return 50;
      default:
        return 0;
    }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.05,
              
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.04,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tabs.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => setState(() => currentIndex = index),
                            child: Padding(
                              padding: EdgeInsets.only(left: index == 0 ? 10 : 22 , top: 7),
                              child: Text(tabs[index] , style: GoogleFonts.ubuntu(
                                color: currentIndex == index ? Colors.black : Colors.grey,
                                fontSize: currentIndex == index ? 16 : 14,
                                fontWeight: currentIndex == index ? FontWeight.w600 : FontWeight.w400,
                              ),
                             ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    bottom: 0,
                    left: changePositionOfLine(),
                    curve: Curves.fastEaseInToSlowEaseOut,
                    duration: Duration(milliseconds: 500),
                    child: AnimatedContainer(
                      curve: Curves.fastEaseInToSlowEaseOut,
                      margin: const EdgeInsets.only(left: 10),
                      duration: const Duration(milliseconds: 500),
                      width: changeContainerWidth(),
                      height: size.height * 0.008,
                      decoration: BoxDecoration(
                        // color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                  
                      ),
                    ),
                  ),
                    
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/