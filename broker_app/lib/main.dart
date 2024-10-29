// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
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
            SizedBox(width: 30),
          ],
        ),
        body: const Center(),
      ),
    );
  }
}
