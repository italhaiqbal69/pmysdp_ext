import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImagePractice extends StatelessWidget {
  const ImagePractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,

            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.9),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(120),
                bottomRight: Radius.circular(120),
              ),
            ),
            child: Center(
              child: Text(
                'Bat Man',
                style: GoogleFonts.pacifico(fontSize: 50, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 100),
          Container(
            height: 300,
            width: double.infinity,

            decoration: BoxDecoration(
              color: Colors.pink,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://i.pinimg.com/1200x/8a/48/24/8a482472ddd198659d23623b7c8ec314.jpg',
                ),
              ),
            ),
            // child: Image.asset('assets/julaman.jpeg'),
          ),
        ],
      ),
    );
  }
}
