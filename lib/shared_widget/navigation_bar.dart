import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newwa/screens/favorite.dart';
import 'package:newwa/screens/profile/student_profile.dart';
import 'package:newwa/screens/setting_screen.dart';
import 'package:newwa/screens/student/level_sceen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Bottom Navigation Bar',
      home: NavigationBarScreen(),
    ),
  );
}

class NavigationBarScreen extends StatefulWidget {
  @override
  NavigationBarScreenState createState() => NavigationBarScreenState();
}

class NavigationBarScreenState extends State<NavigationBarScreen> {
  var currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: IndexedStack(
        children: [
          ProfilePage(),
          FavoriteScreen(),
          LevelScreen(),
          SettinScreen(),
        ],
        index: currentIndex,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .32
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? displayWidth * .12 : 0,
                    width: index == currentIndex ? displayWidth * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? Colors.blueAccent.withOpacity(.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .31
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .13 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex
                                  ? '${listOfStrings[index]}'
                                  : '',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .03 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == currentIndex
                                ? Colors.blueAccent
                                : Colors.black26,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.person_rounded,
    Icons.favorite_rounded,
    Icons.home_rounded,
    Icons.settings_rounded,
  ];

  List<String> listOfStrings = [
    'Account',
    'Favorite',
    'Home',
    'Settings',
  ];
}



      



















//firest navigation bar
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:newwa/screens/profile/student_profile.dart';
// import 'package:newwa/screens/setting_screen.dart';
// import 'package:newwa/screens/student//level_sceen.dart';

// class NavigationBarScreen extends StatefulWidget {
//   @override
//   _NavigationBarScreenState createState() => _NavigationBarScreenState();
// }

// class _NavigationBarScreenState extends State<NavigationBarScreen> {
//   int selected = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
        
//         children: [
//            ProfilePage(),
//            LevelScreen(),
//            SettinScreen(),
     
//         ],
//         index: selected,
//       ),
     
//       bottomNavigationBar: ConvexAppBar(
//         backgroundColor: const Color.fromARGB(255, 86, 170, 113),
//         height: 70,
//         initialActiveIndex: 1,
//         // cornerRadius:,
//         onTap: (n) {
//           setState(() {
//             selected = n;
//           });
//         },
//         items: const [
          
          
//           TabItem(
//             icon: Icon(Icons.supervised_user_circle),
//             title: 'الحساب',
//           ),
//           TabItem(
//             icon: Icon(Icons.home),
//             title: 'الرئيسية',
//           ),
//           TabItem(
//             icon: Icon(Icons.settings),
//             title: 'الإعدادات',
//           ),
//         ],
//       ),
//     );
//   }
// }
