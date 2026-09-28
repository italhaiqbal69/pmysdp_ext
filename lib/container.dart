import 'package:flutter/material.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 400,

          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://images.pexels.com/photos/7135013/pexels-photo-7135013.jpeg?_gl=1*1sqaqpz*_ga*OTUxMTIwMjY5LjE3NjcwNjk2NTI.*_ga_8JE65Q40S6*czE3ODYwMTUwMzgkbzYkZzEkdDE3ODYwMTUxNjEkajU1JGwwJGgw',
              ),
            ),
            color: Colors.pink,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(color: Colors.purple, blurRadius: 70, spreadRadius: 12),
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: 100,
                width: 100,

                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://images.pexels.com/photos/1656684/pexels-photo-1656684.jpeg?_gl=1*16l24nl*_ga*OTUxMTIwMjY5LjE3NjcwNjk2NTI.*_ga_8JE65Q40S6*czE3ODYwMTUwMzgkbzYkZzEkdDE3ODYwMTUwNTYkajQyJGwwJGgw',
                    ),
                  ),
                  color: Colors.white,
                  shape: BoxShape.circle,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple,
                      blurRadius: 70,
                      spreadRadius: 12,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.purple,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Talha Iqbal',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.purple,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Position',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.purple,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.purple,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
