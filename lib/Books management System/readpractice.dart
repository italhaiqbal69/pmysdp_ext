import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Readpractice extends StatelessWidget {
  const Readpractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('books').snapshots(),
        builder: (context, snapshot) {
          return GridView.builder(
            itemCount: snapshot.data!.docs.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        snapshot.data!.docs[index]['image'].toString(),
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        snapshot.data!.docs[index]['author'].toString(),
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
