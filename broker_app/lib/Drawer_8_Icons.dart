// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, , prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables

import 'package:broker_app/more_services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(YourDrawerPage());
}

class YourDrawerPage extends StatefulWidget {
  @override
  _YourDrawerPageState createState() => _YourDrawerPageState();
}

class _YourDrawerPageState extends State<YourDrawerPage> {
  // Step 1: Declare variables to manage state
  bool _isExpanded = false; // Tracks if icons are shown
  String _buttonText =
      "+4 more Services"; // Button text to toggle between "Show more" and "Hide"

  // Method to toggle the expanded state
  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      _buttonText = _isExpanded ? "View Less" : "+4 more Services";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
          height: _isExpanded ? 130.0 : 0.0, // Height changes with expansion
          curve: Curves.easeInOut, // Smooth animation curve
          child: _isExpanded
              ? Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // First Circle without note
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color.fromARGB(
                                    255, 190, 188, 188), // Milkish color
                                child: Image.asset(
                                  'assets/paint_bucket.png', // Path to your image
                                  width: 31, // Set the desired width
                                  height: 31, // Set the desired height
                                  fit: BoxFit
                                      .contain, // Adjust the image fitting
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Painting",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        // Second Circle with note
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment
                                  .center, // Center the circle and note container
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      Color.fromARGB(255, 190, 188, 188),
                                  child: Image.asset(
                                    'assets/courrier_truck.png', // Path to your image
                                    width: 33, // Set the desired width
                                    height: 33, // Set the desired height
                                    fit: BoxFit
                                        .contain, // Adjust the image fitting
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Column(
                              children: [
                                Text(
                                  "Packers",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "& Movers",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),

                        // Third Circle with note
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      Color.fromARGB(255, 190, 188, 188),
                                  child: Image.asset(
                                    'assets/home_cleaning.png', // Path to your image
                                    width: 33, // Set the desired width
                                    height: 33, // Set the desired height
                                    fit: BoxFit
                                        .contain, // Adjust the image fitting
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Column(
                              children: [
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Cleaning",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),

                        // Fourth Circle with note
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      Color.fromARGB(255, 190, 188, 188),
                                  child: Image.asset(
                                    'assets/ac.png', // Path to your image
                                    width: 38, // Set the desired width
                                    height: 38, // Set the desired height
                                    fit: BoxFit
                                        .contain, // Adjust the image fitting
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Column(
                              children: [
                                Text(
                                  "AC",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Repair",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Container(), // Empty container when collapsed
        ),

        // Step 2: Add the expandable button
        GestureDetector(
          onTap: _toggleExpand, // Call the toggle method on tap
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _buttonText,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.arrow_downward : Icons.arrow_upward,
                  ),
                ],
              ),
            ),
          ),
        ),
        ExpandableContainer(
          title: 'My Services',
          items: [
            'My Tenant Relationship Manager',
            'My Owner Relationship Manager',
          ],
        ),
        ExpandableContainer(
          title: 'NBcash Wallet',
          items: [
            'My Tenant Relationship Manager',
            'My Owner Relationship Manager',
          ],
        ),
        ExpandableContainer(
          title: 'Resdientail Plans',
          items: [
            'My Tenant Relationship Manager',
            'My Owner Relationship Manager',
          ],
        ),
        ExpandableContainer(
          title: 'Commercial Plans',
          items: [
            'My Tenant Relationship Manager',
            'My Owner Relationship Manager',
          ],
        ),
      ],
    );
  }
}
