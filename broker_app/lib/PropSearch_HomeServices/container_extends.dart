// ignore_for_file: avoid_print

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
    isScrollControlled: true, // Allows customization of the height
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0), // Customizable border radius
            topRight: Radius.circular(16.0), // Customizable border radius
          ),
        ),
        height: 490, // Set a customizable height here (adjust as needed)
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(right: 16.0), // Padding to the right
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10),
                  child: Text(
                    'Select your city',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: 40), // Space between "Select your city" and the column

            // Column for rows
            Expanded(
              child: Column(
                children: [
                  // Row 1
                  _buildRow1(),
                  SizedBox(height: 20), // Gap between rows
                  // Row 2
                  _buildRow2(),
                  SizedBox(height: 20), // Gap between rows
                  // Row 3
                  _buildRow3(),
                  SizedBox(height: 20), // Gap between rows
                  // Row 4
                  _buildRow4(),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildRow1() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildExpandedItem('assets/bangalore.jpg', 'Bangalore'),
      _buildExpandedItem('assets/mumbai.jpg', 'Mumbai'),
      _buildExpandedItem('assets/chennai.jpg', 'Chennai'),
    ],
  );
}

Widget _buildRow2() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildExpandedItem('assets/pune.jpg', 'Pune'),
      _buildExpandedItem('assets/hyderabad.jpg', 'Hyderabad'),
      _buildExpandedItem('assets/gurgaon.jpg', 'Gurgaon'),
    ],
  );
}

Widget _buildRow3() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildExpandedItem('assets/delhi.jpg', 'Delhi'),
      _buildExpandedItem('assets/noida.jpg', 'Noida'),
      _buildExpandedItem('assets/gnoida.jpg', 'Greater Noida'),
    ],
  );
}

Widget _buildRow4() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildExpandedItem('assets/ghaziabad.jpg', 'Ghaziabad'),
      _buildExpandedItem('assets/faridabad.jpg', 'Faridabad'),
      _buildExpandedItem('assets/ahemedabad.png', 'Ahemdabad'),
    ],
  );
}

Widget _buildExpandedItem(String imagePath, String labelText) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        // Action for when the item is clicked
        print('$labelText clicked');
      },
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              imagePath,
              width: 50, // Adjust this to the desired size
              height: 50, // Adjust this to the desired size
              fit: BoxFit
                  .cover, // Ensures the image covers the entire circular area
            ),
          ),
          SizedBox(height: 6),
          Text(
            labelText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
