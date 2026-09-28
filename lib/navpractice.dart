import 'package:flutter/material.dart';
import 'package:summerofcode_ext/homescreen.dart';

class Navpractice extends StatefulWidget {
  const Navpractice({super.key});

  @override
  State<Navpractice> createState() => _NavpracticeState();
}

class _NavpracticeState extends State<Navpractice> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Homescreen()),
                  );
                },
              ),
              ListTile(title: Text('Home'), leading: Icon(Icons.home)),
              ListTile(title: Text('Home'), leading: Icon(Icons.home)),
              ListTile(title: Text('Home'), leading: Icon(Icons.home)),
              ListTile(title: Text('Home'), leading: Icon(Icons.home)),
            ],
          ),
        ),
        appBar: AppBar(backgroundColor: Colors.yellow),
        body: Container(color: Colors.pink),
      ),
    );
  }
}
