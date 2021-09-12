import 'package:flutter/material.dart';
import 'package:tutorplanner/screen/ListPage.dart';
import '../screen/HomePage.dart';
import '../screen/MapPage.dart';
import '../screen/ProfilePage.dart';
import '../screen/TransactionPage.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: nav(),
    );
  }
}

class nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<nav> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    ListPage(),
    MapPage(),
    TransactionPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Student List',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.money),
              label: 'Transaction',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.grey),
        ],
      ),
    );
  }
}
