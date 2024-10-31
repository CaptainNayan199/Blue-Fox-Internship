// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

// import 'package:broker_app/icons_8.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class DrawerHeaderUI extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DrawerHeaderUI({super.key, required this.scaffoldKey});
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Column(
      children: [
        Container(
          color: Colors.redAccent, // Background color for header
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20),
              // Profile Icon and Login/Signup Text
              Row(
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child:
                        Icon(Icons.account_circle, color: Colors.red, size: 43),
                  ),
                  SizedBox(width: 14), // Spacer between icon and text
                  Text(
                    "Login / Signup",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 72),
                  IconButton(
                    onPressed: () {
                      scaffoldKey.currentState?.closeDrawer();
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                ],
              ),
              SizedBox(height: 22),
              Row(
                children: [
                  SizedBox(
                    height: 70,
                    width: 307,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white, // Black text color
                        padding: EdgeInsets.all(6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44, // Width of the background box
                            height: 44, // Height of the background box
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 223, 234,
                                  216), // Light green background color
                              borderRadius: BorderRadius.circular(
                                  5), // Optional: add rounded corners
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/home_icon.png',
                                width: 40, // Adjust width of the icon if needed
                                height:
                                    40, // Adjust height of the icon if needed
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Post your property",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 9),
                          Container(
                            width: 50,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                "FREE",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              )
            ],
          ),
        ),
        // second part after the header
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Column
              Padding(
                padding: const EdgeInsets.only(top: 28),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Because ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            TextSpan(
                              text: "Your Home",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Deserves The Best.",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),

              // Right Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.group, color: Colors.green, size: 28),
                    SizedBox(height: 2),
                    RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "3Lacs+ ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: "Services",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2),
                    RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "booked in ",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          TextSpan(
                            text: "last 3 months",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // 3rd part of the drawer

        SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: const Color.fromARGB(255, 242, 244, 246), // Border color
              width: 1.0, // Border width
            ),
          ),
          child: Stack(
            children: [
              // Main image
              Image.asset(
                'assets/packers_movers_large.png', // Replace with your image URL
                // fit: BoxFit.cover,
                width: 300,
                height: 200,
              ),
              // Transparent container
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(7.0), // Specify as Radius
                      bottomRight: Radius.circular(7.0),
                    ),
                    color: const Color.fromARGB(255, 46, 45, 45)
                        .withOpacity(0.7), // Transparent white
                  ),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Small image
                      Center(
                        child: Image.asset(
                          'assets/packers_movers_small.jpg', // Replace with your small image URL
                          width: 40,
                          height: 40,
                        ),
                      ),
                      // Text
                      Text(
                        'Packers and Movers',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      // Elevated Button
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 53,
                          height: 33,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              "Book",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // First Circle without note
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor:
                        Color.fromARGB(255, 190, 188, 188), // Milkish color
                    child: Image.asset(
                      'assets/paint_bucket.png', // Path to your image
                      width: 31, // Set the desired width
                      height: 31, // Set the desired height
                      fit: BoxFit.contain, // Adjust the image fitting
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Painting",
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              // Second Circle with note
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment
                          .center, // Center the circle and note container
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color.fromARGB(255, 190, 188, 188),
                          child: Image.asset(
                            'assets/courrier_truck.png', // Path to your image
                            width: 33, // Set the desired width
                            height: 33, // Set the desired height
                            fit: BoxFit.contain, // Adjust the image fitting
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
              ),

              // Third Circle with note
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color.fromARGB(255, 190, 188, 188),
                          child: Image.asset(
                            'assets/home_cleaning.png', // Path to your image
                            width: 33, // Set the desired width
                            height: 33, // Set the desired height
                            fit: BoxFit.contain, // Adjust the image fitting
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
              ),

              // Fourth Circle with note
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color.fromARGB(255, 190, 188, 188),
                          child: Image.asset(
                            'assets/ac.png', // Path to your image
                            width: 38, // Set the desired width
                            height: 38, // Set the desired height
                            fit: BoxFit.contain, // Adjust the image fitting
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
