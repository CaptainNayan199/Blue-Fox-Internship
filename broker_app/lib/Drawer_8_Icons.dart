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
                                backgroundColor:
                                    Color(0xFFF7FCFF), // Milkish color
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
                                  backgroundColor: Color(0xFFF7FCFF),
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
                                  backgroundColor: Color(0xFFF7FCFF),
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
                                  backgroundColor: Color(0xFFF7FCFF),
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
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        ExpandableContainer(
          title: 'My Services',
          items: [
            {
              'text': 'My Tenant Relationship Manager',
              'icon': Icons.person,
            },
            {
              'text': 'My Owner Relationship Manager',
              'icon': Icons.home,
            },
            // Add more items with different icons and trailing widgets
          ],
        ),

        ExpandableContainer(
          title: 'NBcash Wallet',
          items: [
            {
              'text': 'Wallet Summary',
              'icon': Icons.account_balance_wallet, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.blue,
                child: Text('Info', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Rewards',
              'icon': Icons.star, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.green,
                child: Text('New', style: TextStyle(color: Colors.white)),
              ),
            },
          ],
        ),

        ExpandableContainer(
          title: 'Residential Plans',
          items: [
            {
              'text': 'For Owners',
              'icon': Icons.house, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.blue,
                child: Text('Details', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'For Sellers',
              'icon': Icons.sell, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.red,
                child: Text('Offers', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'For Tenants',
              'icon': Icons.person, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.orange,
                child: Text('Explore', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'For Buyers',
              'icon': Icons.shopping_cart, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.purple,
                child: Text('Deals', style: TextStyle(color: Colors.white)),
              ),
            },
          ],
        ),

        ExpandableContainer(
          title: 'Commercial Plans',
          items: [
            {
              'text': 'For Owners',
              'icon': Icons.business, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.blue,
                child: Text('Details', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'For Sellers',
              'icon': Icons.sell, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.green,
                child: Text('Offers', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'For Tenants',
              'icon': Icons.business_center, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.red,
                child: Text('Explore', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'For Buyers',
              'icon': Icons.shopping_cart, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.purple,
                child: Text('Deals', style: TextStyle(color: Colors.white)),
              ),
            },
          ],
        ),

        ExpandableContainer(
          title: 'Home Services',
          items: [
            {
              'text': 'Packers & Movers',
              'icon': Icons.local_shipping, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.blue,
                child: Text('Info', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Painting',
              'icon': Icons.format_paint, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.green,
                child: Text('Book', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Cleaning',
              'icon': Icons.cleaning_services, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.orange,
                child: Text('Request', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Interiors',
              'icon': Icons.design_services, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.purple,
                child: Text('Explore', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Furniture',
              'icon': Icons.chair, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.yellow,
                child: Text('Shop', style: TextStyle(color: Colors.white)),
              ),
            },
          ],
        ),

        ExpandableContainer(
          title: 'NoBroker Pay',
          items: [
            {
              'text': 'Pay Your Rent',
              'icon': Icons.payment, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.blue,
                child: Text('Pay', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Deposit Payment',
              'icon': Icons.money, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.green,
                child: Text('Pay', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Maintenance Payments',
              'icon': Icons.build, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.orange,
                child: Text('Pay', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Bill Payments',
              'icon': Icons.receipt, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.purple,
                child: Text('Pay', style: TextStyle(color: Colors.white)),
              ),
            },
          ],
        ),

        ExpandableContainer(
          title: 'Legal Assistance & Loan',
          items: [
            {
              'text': 'Rental Agreement',
              'icon': Icons.document_scanner, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.blue,
                child: Text('Details', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Police Intimation',
              'icon': Icons.policy, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.green,
                child: Text('Details', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Tenant Verification',
              'icon': Icons.check_circle, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.orange,
                child: Text('Verify', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Property Legal Assistance',
              'icon': Icons.gavel, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.purple,
                child: Text('Assist', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Home Loan',
              'icon': Icons.home, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.blue,
                child: Text('Apply', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Home Deposit Loan',
              'icon': Icons.money_off, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.green,
                child: Text('Apply', style: TextStyle(color: Colors.white)),
              ),
            },
          ],
        ),

        ExpandableContainer(
          title: 'Utilities',
          items: [
            {
              'text': 'Know Your Rent',
              'icon': Icons.info, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.blue,
                child: Text('Details', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Create Rent Receipts',
              'icon': Icons.receipt, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.green,
                child: Text('Create', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Click & Earn',
              'icon': Icons.money, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.orange,
                child: Text('Earn', style: TextStyle(color: Colors.white)),
              ),
            },
          ],
        ),

        ExpandableContainer(
          title: 'Help & Support',
          items: [
            {
              'text': 'Support Topics',
              'icon': Icons.help, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.blue,
                child: Text('Read', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Blog',
              'icon': Icons.article, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.green,
                child: Text('Explore', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Feedback',
              'icon': Icons.feedback, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.orange,
                child: Text('Give', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'About Us',
              'icon': Icons.info_outline, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.purple,
                child: Text('Learn', style: TextStyle(color: Colors.white)),
              ),
            },
            {
              'text': 'Chat With Us',
              'icon': Icons.chat, // Replace with actual icon
              'trailing': Container(
                padding: EdgeInsets.all(4),
                color: Colors.blue,
                child: Text('Chat', style: TextStyle(color: Colors.white)),
              ),
            },
          ],
        ),

        // ExpandableContainer(
        //   title: 'NBcash Wallet',
        //   items: [
        //     'Wallet Summary',
        //     'Rewards',
        //   ],
        // ),
        // ExpandableContainer(
        //   title: 'Resdientail Plans',
        //   items: ['For Owners', 'For Sellers', 'For Tenants', 'For Buyers'],
        // ),
        // ExpandableContainer(
        //   title: 'Commercial Plans',
        //   items: ['For Owners', 'For Sellers', 'For Tenants', 'For Buyers'],
        // ),
        // ExpandableContainer(
        //   title: 'Home Services',
        //   items: [
        //     'Packers & Movers',
        //     'Painting',
        //     'Cleaning',
        //     'Interiors',
        //     'Furniture'
        //   ],
        // ),
        // ExpandableContainer(
        //   title: 'NoBroker Pay',
        //   items: [
        //     'Pay Your Rent',
        //     'Deposit Payment',
        //     'Maintenance Payments',
        //     'Bill Payments'
        //   ],
        // ),
        // ExpandableContainer(
        //   title: 'Legal Assitance & Loan',
        //   items: [
        //     'Rental Agreement',
        //     'Police Intimation',
        //     'Tenant Verification',
        //     'Property Legal Assistance',
        //     'Home Loan',
        //     'Home Deposit Loan'
        //   ],
        // ),
        // ExpandableContainer(
        //   title: 'Utilities',
        //   items: ['Know Your Rent', 'Create Rent Receipts', 'Click & Earn'],
        // ),
        // ExpandableContainer(
        //   title: 'Help & Support',
        //   items: [
        //     'Support Topics',
        //     'Blog',
        //     'Feedback',
        //     'About Us',
        //     'Chat With Us'
        //   ],
        // ),
      ],
    );
  }
}
