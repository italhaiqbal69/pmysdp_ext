import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Scenrey extends StatelessWidget {
  const Scenrey({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f1db),
      body: Column(
        children: [
          Image.network(
            'https://images.pexels.com/photos/38812401/pexels-photo-38812401.jpeg?_gl=1*1iw1q9w*_ga*OTUxMTIwMjY5LjE3NjcwNjk2NTI.*_ga_8JE65Q40S6*czE3ODY0NDg2MDMkbzckZzEkdDE3ODY0NDg2MDQkajU5JGwwJGgw',
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flowers garden',
                    style: GoogleFonts.pacifico(fontSize: 24),
                  ),
                  Text(
                    'A visit to the Garden',
                    style: GoogleFonts.tangerine(fontSize: 24),
                  ),
                ],
              ),
              Icon(Icons.star),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.call, size: 30),
                  Text('Call', style: GoogleFonts.tangerine(fontSize: 24)),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.route, size: 30),
                  Text('Route', style: GoogleFonts.tangerine(fontSize: 24)),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.share, size: 30),
                  Text('Share', style: GoogleFonts.tangerine(fontSize: 24)),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '''ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library in London, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software like Aldus PageMaker and Microsoft Word including versions of Lorem Ipsum.''',
              textAlign: TextAlign.start,
              style: GoogleFonts.tangerine(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xff1e2c09),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
