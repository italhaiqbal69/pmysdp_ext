import 'package:flutter/material.dart';

class Listviewbuilderpractice extends StatefulWidget {
  const Listviewbuilderpractice({super.key});

  @override
  State<Listviewbuilderpractice> createState() =>
      _ListviewbuilderpracticeState();
}

class _ListviewbuilderpracticeState extends State<Listviewbuilderpractice> {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: double.infinity,
              color: colors[index],
            ),
          );
        },
      ),
    );
  }
}
