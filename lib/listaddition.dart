import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Listaddition extends StatefulWidget {
  const Listaddition({super.key});

  @override
  State<Listaddition> createState() => _ListadditionState();
}

class _ListadditionState extends State<Listaddition> {
  List messages = [];
  TextEditingController msgController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    msgController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 30),
        child: Column(
          children: [
            TextField(
              controller: msgController,
              decoration: InputDecoration(
                hintText: 'Add Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                if (messages.contains(msgController.text.toString())) {
                  return;
                }
                messages.add(msgController.text.toString());
                msgController.clear();
                setState(() {});
              },
              child: Container(
                height: 50,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Add Message',
                    style: GoogleFonts.pacifico(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: Border.all(color: Colors.black, width: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            messages[index],
                            style: GoogleFonts.pacifico(fontSize: 40),
                          ),
                          GestureDetector(
                            onTap: () {
                              messages.removeAt(index);
                              setState(() {});
                            },
                            child: Icon(Icons.delete),
                          ),
                        ],
                      ),
                      color: Colors.amber,
                    ),
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
