import 'package:flutter/material.dart';

class GridPractice extends StatelessWidget {
  const GridPractice({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.cyan,
      Colors.blue,
      Colors.green,
      Colors.indigo,
    ];
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
    return Scaffold(
      body: GridView.builder(
        itemCount: fruits.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: fruits[index]['color'],
                child: Center(child: Image.asset(fruits[index]['image'])),
              ),
            ),
          );
        },
      ),
    );
  }
}
