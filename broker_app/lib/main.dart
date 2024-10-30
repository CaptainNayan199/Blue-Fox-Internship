// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:broker_app/dashboard_painter.dart';
import 'package:broker_app/drawer_header.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        // ignore: sized_box_for_whitespace
        drawer: Container(
          width: MediaQuery.of(context).size.width *
              0.85, // Adjust width as needed
          child: Drawer(
            child: Column(
              children: [
                DrawerHeaderUI(scaffoldKey: scaffoldKey),
                // Additional drawer items here
              ],
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(110), // Specify the height of the AppBar
          child: Container(
            // margin: EdgeInsets.only(top: 10.0), // Create space above the border
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color.fromARGB(
                      255, 238, 236, 236), // Set the border color
                  width: 2.0, // Set the border width
                ),
              ),
            ),
            child: AppBar(
              backgroundColor: const Color.fromARGB(255, 238, 236, 236),
              titleSpacing: 10,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 35, // Adjust the size to make the icon bigger
                  ),
                  onPressed: () {
                    Scaffold.of(context)
                        .openDrawer(); // This context now has access to the Scaffold
                  },
                ),
              ),
              title: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "%",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "NO",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: "BROKER",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.chat_bubble_outline,
                        size: 23,
                        color: Colors.black45,
                      ),
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 9, // Position dot to the top-right corner
                      top: 8,
                      child: Container(
                        width: 9, // Size of the dot
                        height: 9,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer circle with yellowish background
                    Container(
                      width: 33, // Adjust size as needed
                      height: 33,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 255, 175, 55), // Use a yellowish-orange color
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          "N",
                          style: TextStyle(
                            fontSize: 19, // Adjust size of "N"
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Color of the letter "N"
                          ),
                        ),
                      ),
                    ),

                    // Inner ring overlaying the main circle
                    Positioned(
                      top: 3, // Adjust positioning as needed to center over "N"
                      child: Container(
                        width:
                            27, // Smaller than the outer circle to create a ring effect
                        height: 27,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color.fromARGB(255, 255, 243, 7),
                              width: 3), // Ring border
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer circle with segmented border
                    Container(
                      width: 45, // Adjust size as needed
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // Background color of the outer circle
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors
                              .red, // Adjust to desired color of the dashed border segments
                          width: 2,
                        ),
                      ),
                      child: CustomPaint(
                        painter: DashedBorderPainter(),
                      ),
                    ),

                    Container(
                      width: 35, // Smaller than the outer circle
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 234, 212,
                            220), // Light pink background for inner circle
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.bolt, // Thunderbolt icon
                        color: const Color.fromARGB(255, 239, 152,
                            22), // Yellowish-orange color for the icon
                        size: 30, // Adjust icon size as needed
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Transform.translate(
                        offset: Offset(22,
                            -1), // Adjust this value to move the badge further to the right
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4), // Add padding for spacing
                          decoration: BoxDecoration(
                            color: Colors
                                .green, // Background color for "New" badge
                            borderRadius:
                                BorderRadius.circular(10), // Oval shape
                          ),
                          child: Text(
                            "New",
                            style: TextStyle(
                              color: Colors.white, // Text color inside badge
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                )
              ],
            ),
          ),
        ),
        body: const Center(),
      ),
    );
  }
}
