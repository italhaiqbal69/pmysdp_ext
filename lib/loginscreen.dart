import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summerofcode_ext/gridviewpractice.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff87c3c3),
        body: Column(
          children: [
            Image.network(
              'https://images.pexels.com/photos/8422105/pexels-photo-8422105.jpeg?_gl=1*ewmges*_ga*OTUxMTIwMjY5LjE3NjcwNjk2NTI.*_ga_8JE65Q40S6*czE3ODY1MzI3OTIkbzgkZzEkdDE3ODY1MzI4MjIkajMwJGwwJGgw',
            ),
            SizedBox(height: 30),
            Text(
              'Kiidie',
              style: GoogleFonts.passeroOne(
                fontSize: 50,
                color: Color(0xff0c4457),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email', style: GoogleFonts.passeroOne()),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: GoogleFonts.passeroOne(),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Password', style: GoogleFonts.passeroOne()),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: GoogleFonts.passeroOne(),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 30),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => Gridviewpractice()),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color(0xff0c4457),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            style: GoogleFonts.passeroOne(
                              color: Colors.white,
                              fontSize: 36,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
