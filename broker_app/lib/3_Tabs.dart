// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class TabsUI extends StatefulWidget {
  const TabsUI({super.key});

  @override
  _TabsUIState createState() => _TabsUIState();
}

class _TabsUIState extends State<TabsUI> {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTab('Buy', 0),
            _buildTab('Rent', 1),
            _buildTab('Commercial', 2),
          ],
        ),
        // This should handle layout correctly
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

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
