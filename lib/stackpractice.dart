import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Stackpractice extends StatelessWidget {
  const Stackpractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.withOpacity(0.5),
      body: SizedBox(
        height: 1000,
        child: Stack(
          children: [
            Positioned(
              top: 400,
              left: 50,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(120),
                    topRight: Radius.circular(120),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 200, left: 50),
                  child: Text(
                    'Summers!!!!',
                    style: GoogleFonts.pacifico(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 300,
              left: 30,
              child: Image.asset('assets/pineapple (2).png'),
            ),
          ],
        ),
      ),
    );
  }
}
