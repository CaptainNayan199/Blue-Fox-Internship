import 'package:flutter/material.dart';

class ServicesForYou extends StatefulWidget {
  const ServicesForYou({super.key});

  @override
  State<ServicesForYou> createState() => _ServicesForYouState();
}

class _ServicesForYouState extends State<ServicesForYou> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Services for you',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    // Empty function for now
                  },
                  child: Row(
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.teal,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  buildServiceCard(
                    title: 'Festive Painting',
                    description: '1 year service warranty',
                    tag: 'Festive sale is Live',
                    icon: Icons.format_paint,
                    isTagOnTop: true,
                  ),
                  buildServiceCard(
                    title: 'Packers & Movers',
                    description: '',
                    tag: 'Upto 30% off',
                    icon: Icons.local_shipping,
                    isTagOnTop: true,
                  ),
                  buildServiceCard(
                    title: 'Pay Rent',
                    description: '',
                    tag: 'New Offers',
                    icon: Icons.payment,
                    isTagOnTop: true,
                  ),
                  buildServiceCard(
                    title: 'Carpentry & Plumbing',
                    description: '',
                    tag: 'Starting @ ₹369',
                    icon: Icons.build,
                    isTagOnTop: false,
                  ),
                  buildServiceCard(
                    title: 'Home Cleaning',
                    description: '',
                    tag: 'Starting @ ₹369',
                    icon: Icons.cleaning_services,
                    isTagOnTop: false,
                  ),
                  buildServiceCard(
                    title: 'Rental Agreement',
                    description: '',
                    tag: 'Flat 30% off',
                    icon: Icons.article,
                    isTagOnTop: true,
                  ),
                  buildServiceCard(
                    title: 'Refer & Earn',
                    description: '',
                    tag: 'Flat 30% off',
                    icon: Icons.campaign,
                    isTagOnTop: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildServiceCard({
  required String title,
  required String description,
  required String tag,
  required IconData icon,
  required bool isTagOnTop,
}) {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          blurRadius: 8,
          spreadRadius: 2,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isTagOnTop) buildTag(tag),
        SizedBox(height: isTagOnTop ? 8 : 0),
        Center(
          child: Icon(
            icon,
            size: 40,
            color: Colors.teal,
          ),
        ),
        SizedBox(height: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (description.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
        if (!isTagOnTop) SizedBox(height: 8),
        if (!isTagOnTop) buildTag(tag),
      ],
    ),
  );
}

Widget buildTag(String tag) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.amber.shade100,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      tag,
      style: TextStyle(
        color: Colors.orange,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
