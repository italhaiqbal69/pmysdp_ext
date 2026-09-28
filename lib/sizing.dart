import 'package:flutter/material.dart';

class Sizing extends StatelessWidget {
  const Sizing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple),
      body: Column(
        children: [
          Container(height: 100, width: 100, color: Colors.pink),
          Spacer(),
          Container(height: 100, width: 100, color: Colors.green),
        ],
      ),
    );
  }
}
