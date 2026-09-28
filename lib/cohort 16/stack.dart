import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StackPractice extends StatelessWidget {
  const StackPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 700,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(140),
                  bottomRight: Radius.circular(140),
                ),
              ),
            ),
            Positioned(
              top: 270,
              left: 80,
              child: Image.asset('assets/biryani.png', height: 250),
            ),
            Positioned(
              top: 550,
              left: 50,
              child: Text(
                'Ghazi Biryani',
                style: GoogleFonts.pacifico(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  color: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
