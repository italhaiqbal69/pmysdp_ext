import 'package:flutter/material.dart';
import 'package:summerofcode_ext/cohort%2016/gridview.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GridPractice()),
            );
          },
          child: Container(
            height: 50,
            width: 300,
            color: Colors.pink,
            child: Center(
              child: Text(
                'Screen 1 ',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
