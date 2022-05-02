import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_worker_app/screens/profile/profile.dart';
import 'package:skilled_worker_app/screens/settings/settings.dart';

import '../screens/home/home.dart';

class BottomNavigation extends StatefulWidget {
  int currentIndex = 0;
  BottomNavigation({required this.currentIndex});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF210D41),
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xFFAEBEC9),
      iconSize: 30,
      showUnselectedLabels: false,
      currentIndex: widget.currentIndex,
      onTap: (index) => setState(() {
        widget.currentIndex = index;

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
