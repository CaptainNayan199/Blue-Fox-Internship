// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(IconApp());
}

class IconApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Service Page'),
        ),
        body: ServicePage(),
      ),
    );
  }
}

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  // State to manage the visibility of extra services
  bool _showExtraServices = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20),

        // Top Section with 4 circles
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return Column(
              children: [
                // Circle with Icon and Note
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    // Circle with Icon
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200, // Milkish color
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.brush, // Replace with your icons
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    // Note above the circle
                    if (index > 0) // Display note only on 2nd, 3rd, 4th circles
                      Positioned(
                        top: -20,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue, // Background color for the note
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            index == 1
                                ? "Upto 30% off"
                                : index == 2
                                    ? "Starts at Rs 32"
                                    : "Limited Offer",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 8),
                // Label below the circle
                Text(
                  index == 0
                      ? "Painting"
                      : index == 1
                          ? "Plumbing"
                          : index == 2
                              ? "Cleaning"
                              : "Electrical",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            );
          }),
        ),
        SizedBox(height: 20),

        // Expandable Container
        GestureDetector(
          onTap: () {
            setState(() {
              _showExtraServices = !_showExtraServices;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _showExtraServices ? "View less" : "+4 more services",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(width: 8),
                Icon(
                  _showExtraServices
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),

        // Extra Services Section
        if (_showExtraServices)
          Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons
                              .home_repair_service, // Replace with appropriate icons
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        index == 0
                            ? "Carpentry"
                            : index == 1
                                ? "Gardening"
                                : index == 2
                                    ? "Decor"
                                    : "Moving",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(height: 10),
            ],
          ),
      ],
    );
  }
}
