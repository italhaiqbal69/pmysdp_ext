import 'package:flutter/material.dart';

class RowColumn extends StatelessWidget {
  const RowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple),
      body: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            color: Colors.green,
            child: Center(child: Text('1', style: TextStyle(fontSize: 40))),
          ),
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                color: Colors.cyan,
                child: Center(child: Text('2', style: TextStyle(fontSize: 40))),
              ),
              Container(height: 80, width: 320, color: Colors.red),
            ],
          ),
          Container(height: 400, width: double.infinity, color: Colors.purple),
          Container(height: 200, width: double.infinity, color: Colors.blue),
        ],
      ),
    );
  }
}
