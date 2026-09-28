import 'package:flutter/material.dart';

class RowColumnpractice extends StatelessWidget {
  const RowColumnpractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      body: Column(
        children: [
          Row(
            children: [
              Container(height: 150, width: 150, color: Colors.pink),
              Container(height: 150, width: 150, color: Colors.greenAccent),
            ],
          ),
          Row(
            children: [
              Container(height: 150, width: 150, color: Colors.yellow),
              Container(height: 150, width: 150, color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}
