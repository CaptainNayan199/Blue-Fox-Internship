import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Expandable Info')),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Drawer Header'),
              ),
              ExpandableContainer(
                title: 'My Services',
                items: [
                  'My Tenant Relationship Manager',
                  'My Owner Relationship Manager',
                ],
              ),
              ExpandableContainer(
                title: 'Residential Plans',
                items: [
                  'Basic Plan',
                  'Premium Plan',
                ],
              ),
              // Add more ExpandableContainer widgets as needed
            ],
          ),
        ),
        body: Center(child: Text('Main Content Area')),
      ),
    );
  }
}

class ExpandableContainer extends StatefulWidget {
  final String title;
  final List<String> items;

  const ExpandableContainer(
      {Key? key, required this.title, required this.items})
      : super(key: key);

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
      duration: Duration(milliseconds: 200),
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
          title: Text(widget.title),
          trailing: RotationTransition(
            turns: _arrowAnimation,
            child: Icon(Icons.keyboard_arrow_down),
          ),
          onTap: _toggleExpansion,
        ),
        if (_isExpanded)
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: widget.items
                  .map((item) => Align(
                        alignment: Alignment.centerLeft,
                        child: Text(item),
                      ))
                  .toList(),
            ),
          ),
        Divider(),
      ],
    );
  }
}
