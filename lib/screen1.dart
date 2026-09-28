import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summerofcode_ext/screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Screen2()),
            );
          },
          child: Container(
            height: 50,
            width: 200,
            color: Colors.pink,
            child: Center(
              child: Text(
                'Screen 2 ',
                style: GoogleFonts.inter(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
