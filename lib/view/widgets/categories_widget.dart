import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle =
        GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 15);
    return SizedBox(
      height: MediaQuery.of(context).size.height * .075,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Chip(
                avatar: const Icon(Icons.public),
                backgroundColor: Colors.green.shade800,
                label: Text(
                  'General',
                  style: textStyle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Chip(
                avatar: const Icon(Icons.work),
                label: Text('Business', style: textStyle),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Chip(
                avatar: const Icon(Icons.sports_esports),
                label: Text('Entertainment', style: textStyle),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Chip(
                avatar: const Icon(Icons.monitor_heart),
                label: Text('Health', style: textStyle),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Chip(
                avatar: const Icon(Icons.science),
                label: Text('Science', style: textStyle),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Chip(
                avatar: const Icon(Icons.sports_soccer),
                label: Text('Sports', style: textStyle),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Chip(
                avatar: const Icon(Icons.laptop_mac),
                label: Text('Technology', style: textStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
