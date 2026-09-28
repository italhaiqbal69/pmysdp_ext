import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fruits extends StatefulWidget {
  const Fruits({super.key});

  @override
  State<Fruits> createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
  List<Map> fruits = [
    {
      'name': 'Apple',
      'color': Colors.red.withOpacity(0.8),
      'image': 'assets/apple (2).png',
    },
    {
      'name': 'Banana',
      'color': Colors.yellow.withOpacity(0.8),
      'image': 'assets/banana.png',
    },
    {
      'name': 'BlueBerry',
      'color': Colors.blue.withOpacity(0.8),
      'image': 'assets/blueberry.png',
    },
    {
      'name': 'Orange',
      'color': Colors.orange.withOpacity(0.8),
      'image': 'assets/orange.png',
    },
    {
      'name': 'Peach',
      'color': Colors.orangeAccent.withOpacity(0.8),
      'image': 'assets/peach.png',
    },
    {
      'name': 'PineApple',
      'color': Colors.amberAccent.withOpacity(0.8),
      'image': 'assets/pineapple (2).png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 500,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: fruits[index]['color'],
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: Image.asset(fruits[index]['image'])),
                ),
                Text(
                  fruits[index]['name'],
                  style: GoogleFonts.tangerine(
                    fontSize: 50,
                    color: fruits[index]['color'],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
