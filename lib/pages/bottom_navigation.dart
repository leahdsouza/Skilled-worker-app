import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF210D41),
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xFFAEBEC9),
      iconSize: 30,
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      onTap: (index) => setState(() {
        currentIndex = index;
      }),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Color(0xFF210D41),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.forum),
          label: 'Chats',
          backgroundColor: Color(0xFF210D41),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: Color(0xFF210D41),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: Color(0xFF210D41),
        ),
      ],
    );
  }
}
