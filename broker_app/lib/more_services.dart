// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ExpandableContainer extends StatefulWidget {
  final String title;
  final List<String> items;

  const ExpandableContainer(
      {super.key, required this.title, required this.items});

  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _arrowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _arrowAnimation = Tween<double>(begin: 0, end: 0.5).animate(_controller);
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      _isExpanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.grey[200],
          textColor: Colors.black,
          title: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: RotationTransition(
            turns: _arrowAnimation,
            child: Icon(Icons.keyboard_arrow_down),
          ),
          onTap: _toggleExpansion,
        ),
        if (_isExpanded)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: widget.items
                    .map((item) => Padding(
                          padding: const EdgeInsets.only(
                              bottom: 0.0), // Add bottom spacing here
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(item),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        Divider(),
      ],
    );
  }
}
