// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DrawerHeaderUI extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DrawerHeaderUI({super.key, required this.scaffoldKey});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent, // Background color for header
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile Icon and Login/Signup Text
          Row(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                width: 50,
                height: 50,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Icon(Icons.account_circle, color: Colors.red, size: 43),
              ),
              SizedBox(width: 14), // Spacer between icon and text
              Text(
                "Login / Signup",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 210),
              IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.closeDrawer();
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              )
            ],
          ),
          SizedBox(height: 40),
          // "Post your property" button with arrow icon
          Row(
            children: [
              // SizedBox(
              //   width: 100,
              // ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white, // Black text color
                  padding: EdgeInsets.symmetric(horizontal: 118, vertical: 27),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 25, // Set the icon width
                      height: 25, // Set the icon height
                      child: Image.asset(
                        'assets/home_icon.png', // Path to your image
                        fit: BoxFit
                            .contain, // Ensures the image stays within bounds
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      "Post your property",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "FREE",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
