import 'package:flutter/material.dart';

class Containersetstate extends StatefulWidget {
  const Containersetstate({super.key});

  @override
  State<Containersetstate> createState() => _ContainersetstateState();
}

class _ContainersetstateState extends State<Containersetstate> {
  Color basicColor = Colors.yellow;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            print(count);
            switch (count) {
              case 0:
                basicColor = Colors.pink;
                count++;
                break;
              case 1:
                basicColor = Colors.green;
                count++;
                break;
              case 2:
                basicColor = Colors.orange;
                count++;
                break;
              default:
                count = 0;

                break;
            }
            setState(() {});
          },
          child: Container(height: 300, width: 300, color: basicColor),
        ),
      ),
    );
  }
}
