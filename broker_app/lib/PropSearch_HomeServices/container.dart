// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class PropertySearchPage extends StatefulWidget {
  const PropertySearchPage({super.key});

  @override
  _PropertySearchPageState createState() => _PropertySearchPageState();
}

class _PropertySearchPageState extends State<PropertySearchPage> {
  // Track the selected tab (default to 0 for "Property Search")
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Rounded rectangular container with the tabs
          Container(
            margin: EdgeInsets.all(4), // Add some margin around the container
            padding: EdgeInsets.symmetric(
                vertical: 2), // Padding for vertical spacing
            decoration: BoxDecoration(
              color: Colors.grey[200], // Background color of the container
              borderRadius: BorderRadius.circular(14), // Rounded corners
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Property Search Tab
                _buildTabItem(
                  index: 0,
                  title: "Property Search",
                  isSelected: _selectedTabIndex == 0,
                ),
                // Home Services Tab
                _buildTabItem(
                  index: 1,
                  title: "Home Services",
                  isSelected: _selectedTabIndex == 1,
                ),
              ],
            ),
          ),
          // Placeholder for the body content of the selected tab
          Expanded(
            child: _selectedTabIndex == 0
                ? PropertySearchContent()
                : HomeServicesContent(),
          ),
        ],
      ),
    );
  }

  // Method to build each tab item
  Widget _buildTabItem(
      {required int index, required String title, required bool isSelected}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index; // Update selected tab
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Placeholder widgets for tab content
class PropertySearchContent extends StatelessWidget {
  const PropertySearchContent({super.key});

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
                    style: TextStyle(color: Colors.black54, fontSize: 19),
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: " Zero Brokerage",
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class HomeServicesContent extends StatelessWidget {
  const HomeServicesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Home Services Content"));
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1; // Default selected tab is the middle one (Rent)

  // Pages corresponding to each tab
  final List<Widget> _pages = [
    Center(child: Text('Buy Page')),
    Center(child: Text('Rent Page')),
    Center(child: Text('Commercial Page')),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tabs Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTab('Buy', 0),
            _buildTab('Rent', 1),
            _buildTab('Commercial', 2),
          ],
        ),
        // Page view (based on selected tab)
        Expanded(
          child: _pages[_selectedIndex],
        ),
      ],
    );
  }

  Widget _buildTab(String title, int index) {
    bool isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTabSelected(index),
        child: Container(
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
      ),
    );
  }
}
