import 'package:flutter/material.dart';

class Expandedflexible extends StatelessWidget {
  const Expandedflexible({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      // body: Column(
      //   children: [
      //     Expanded(child: Container(height: 600, color: Colors.pink)),
      //     Text('Hellow world'),
      //     Container(height: 500, color: Colors.green),
      //   ],
      // ),
      // body: Row(
      //   children: [
      //     Container(height: 200, width: 200, color: Colors.green),
      //     Flexible(
      //       child: Container(height: 200, width: 300, color: Colors.yellow),
      //     ),
      //   ],
      // ),
    );
  }
}
