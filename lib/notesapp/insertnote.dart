import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summerofcode_ext/notesapp/updatescreen.dart';

class NotesAdd extends StatelessWidget {
  const NotesAdd({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController notecontroller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.yellow.withOpacity(0.5),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: notecontroller,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                FirebaseFirestore.instance.collection('Notes').doc().set({
                  'note': notecontroller.text.trim(),
                });
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Add note ',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Notes')
                    .snapshots(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          tileColor: Colors.orange,
                          title: Text(snapshot.data!.docs[index]['note']),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Edit
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateNote(
                                        note:
                                            snapshot.data!.docs[index]['note'],
                                        docid: snapshot.data!.docs[index].id,
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Delete
                                  var id = snapshot.data!.docs[index].id;
                                  FirebaseFirestore.instance
                                      .collection('Notes')
                                      .doc(id)
                                      .delete();
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
