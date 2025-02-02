import 'package:flutter/material.dart';

class ExpandableContainer extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> items; // Updated type to include maps

  const ExpandableContainer({
    super.key,
    required this.title,
    required this.items,
  });

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
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
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
                children: widget.items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(item['icon'], size: 20), // Custom icon
                            SizedBox(width: 8), // Spacing between icon and text
                            Expanded(
                              child: Text(item['text']),
                            ),
                            if (item['trailing'] != null)
                              item['trailing'], // Optional trailing widget
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        SizedBox(height: 8),
      ],
    );
  }
}
