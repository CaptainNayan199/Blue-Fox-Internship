// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class PropertySearchContent extends StatefulWidget {
  const PropertySearchContent({super.key});

  @override
  _PropertySearchContentState createState() => _PropertySearchContentState();
}

class _PropertySearchContentState extends State<PropertySearchContent> {
  // Track the selected tab (default to 1 for "Rent" as the middle tab)
  int _selectedIndex = 1; // Default to middle tab (Rent)

  final List<Widget> _pages = [
    Center(child: Text('Buy Page')),
    Center(child: Text('Rent Page')),
    Center(child: Text('Commercial Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "100% Owner Properties |",
                    style: TextStyle(color: Colors.black54, fontSize: 18),
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: " Zero Brokerage",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15), // Space between the text and tabs

        // Row for the 3 tabs
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTab('Buy', 0),
                  _buildTab('Rent', 1),
                  _buildTab('Commercial', 2),
                ],
              ),
              SizedBox(height: 20), // Space between the tabs and the search bar

              // This is the search bar directly below the tabs
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: TextField(
                  // controller: controller,
                  decoration: InputDecoration(
                    // Placeholder centered
                    hintText: 'Search up to 3 Localities or Landmarks',
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 13),

                    // Border configuration
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                      borderRadius:
                          BorderRadius.circular(4.0), // Rounded corners
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(4.0),
                    ),

                    // Trailing search icon inside red container
                    suffixIcon: Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // You can add your search action here
                        },
                        icon: Icon(Icons.search, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFE0F2FE), // Light blue background
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      // Left Column with Text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Looking for Tenants / Buyers?",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.check,
                                    color: Colors.black54, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  "Faster & Verified Tenants/Buyers",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.check,
                                    color: Colors.black54, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  "Pay ZERO brokerage",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                "Post FREE Property Ad",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Right Column with Image
                      SizedBox(width: 16),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.network(
                          'https://gratisography.com/wp-content/uploads/2024/03/gratisography-funflower-800x525.jpg', // Replace with your image asset
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20), // Space between the search bar and content

        // Wrap the content inside a Container with a fixed height
        SizedBox(
          height: 200, // You can adjust this value as per your need
          child: _pages[_selectedIndex],
        ),
      ],
    );
  }

  // Method to build each tab item
  Widget _buildTab(String title, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: Container(
        width: 100, // Fixed width for each tab
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: isSelected
              ? Border(
                  bottom: BorderSide(color: Colors.red, width: 2),
                )
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.red : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomeServicesContent extends StatelessWidget {
  const HomeServicesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Home Services Content"));
  }
}
