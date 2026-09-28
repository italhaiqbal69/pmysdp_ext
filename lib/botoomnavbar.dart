import 'package:flutter/material.dart';
import 'package:summerofcode_ext/container.dart';
import 'package:summerofcode_ext/gridviewpractice.dart';
import 'package:summerofcode_ext/homescreen.dart';
import 'package:summerofcode_ext/listviewpractice.dart';

class Botoomnavbar extends StatefulWidget {
  const Botoomnavbar({super.key});

  @override
  State<Botoomnavbar> createState() => _BotoomnavbarState();
}

class _BotoomnavbarState extends State<Botoomnavbar> {
  int activeindex = 0;

  List<Widget> screens = [Homescreen(), Gridviewpractice(), CardProfile()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Listviewpractice()),
            );
          },
          child: Icon(Icons.add),
        ),
        body: screens[activeindex],
        backgroundColor: Colors.yellow,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: activeindex,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            setState(() {
              activeindex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'favorite',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
