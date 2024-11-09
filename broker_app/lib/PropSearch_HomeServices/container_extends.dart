import 'package:broker_app/PropSearch_HomeServices/container.dart';
import 'package:flutter/material.dart';

class PropertyHome extends StatefulWidget {
  const PropertyHome({super.key});

  @override
  State<PropertyHome> createState() => _PropertyHomeState();
}

class _PropertyHomeState extends State<PropertyHome> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], // Background color of the container
                borderRadius: BorderRadius.circular(60), // Rounded corners
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Property Search Tab
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTabIndex =
                            0; // Set tab index for "Property Search"
                      });
                    },
                    child: _selectedTabIndex == 0
                        ? Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/search-house.png',
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.contain,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "Property Search",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/search-house.png',
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.contain,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "Property Search",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                  // Home Services Tab
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTabIndex =
                            1; // Set tab index for "Home Services"
                      });
                      _showCustomBottomSheet(context);
                    },
                    child: _selectedTabIndex == 1
                        ? Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              color: Color(0xFF52558E),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/wrench.png',
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.contain,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "Home Services",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/wrench.png',
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.contain,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "Home Services",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Placeholder for the body content of the selected tab
        Expanded(
          child: _selectedTabIndex == 0
              ? PropertySearchContent() // Replace with your actual content for Property Search
              : HomeServicesContent(), // Replace with your actual content for Home Services
        ),
      ],
    );
  }
}

// Method to show custom bottom sheet
void _showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Home Services',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            Text('Service 1: Example service description...'),
            SizedBox(height: 10),
            Text('Service 2: Example service description...'),
            // Add more content here
          ],
        ),
      );
    },
  );
}
