// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_bottomnavbar/DetailView.dart';
import 'package:flutter_bottomnavbar/Search.dart';
import 'package:flutter_bottomnavbar/main.dart';

// void main() {
//   runApp(const BottomNavigation());
// }

// class BottomNavigation extends StatelessWidget {
//   const BottomNavigation({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BottomNavigationbar(),
//     );
//   }
// }

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({super.key});

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  // static const TextStyle taboptionStyle = TextStyle(
  //   fontSize: 30,
  //   fontWeight: FontWeight.bold
  // );
  int selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    TabPage1(),
    TabPage2(),
    TabPage3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation Bar"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blueGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_array_rounded),
            label: 'View',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.indigo,
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.cyan[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
