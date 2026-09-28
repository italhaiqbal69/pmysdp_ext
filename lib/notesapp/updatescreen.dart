import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateNote extends StatefulWidget {
  String note;
  String docid;
  UpdateNote({required this.note, required this.docid, super.key});

  @override
  State<UpdateNote> createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  TextEditingController noteController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    noteController = TextEditingController(text: widget.note);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: noteController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () async {
                await FirebaseFirestore.instance
                    .collection('Notes')
                    .doc(widget.docid)
                    .update({'note': noteController.text.trim()});
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.pink,
                child: Center(
                  child: Text(
                    'update note ',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
