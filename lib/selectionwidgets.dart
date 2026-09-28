import 'package:flutter/material.dart';

class Selectionwidgets extends StatefulWidget {
  const Selectionwidgets({super.key});

  @override
  State<Selectionwidgets> createState() => _SelectionwidgetsState();
}

class _SelectionwidgetsState extends State<Selectionwidgets> {
  bool isselcted = false;
  bool isOn = false;

  String gender = '';
  String aaaa = 'aaaa';

  String selectedSuject = 'Islamiat';

  Color color = Colors.green;

  void changeColor(Color insertColor) {
    color = insertColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 50),
        child: Column(
          children: [
            Checkbox(
              value: isselcted,
              onChanged: (value) {
                setState(() {
                  isselcted = value!;
                });
              },
            ),

            Switch(
              value: isOn,
              onChanged: (value) {
                setState(() {
                  isOn = value;
                });
              },
            ),

            RadioListTile<String>(
              value: 'Male',
              title: Text('Male'),
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),
            RadioListTile<String>(
              value: 'Female',
              title: Text('Female'),
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),
            RadioListTile<String>(
              value: 'Others',
              title: Text('Others'),
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),
            RadioListTile<String>(
              value: 'aaaa',
              title: Text('aaa'),
              groupValue: aaaa,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            DropdownButtonFormField(
              items: [
                DropdownMenuItem(child: Text('English'), value: 'English'),
                DropdownMenuItem(child: Text('Urdu'), value: 'Urdu'),
                DropdownMenuItem(child: Text('Islamiat'), value: 'Ismlamiat'),
              ],
              onChanged: (value) {
                selectedSuject = value!;
              },
            ),

            InkWell(
              onTap: () {
                changeColor(Colors.pink);
                setState(() {});
              },
              child: Container(height: 300, width: 300, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
