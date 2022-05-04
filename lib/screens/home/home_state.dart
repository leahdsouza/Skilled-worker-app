import 'package:flutter/material.dart';
import 'package:skilled_worker_app/screens/profile/profile_wrapper.dart';
import 'package:skilled_worker_app/shared/bottom_navigation.dart';

import '../profile/profile.dart';
import '../settings/settings.dart';
import '../home/home.dart';

class HomeState extends StatefulWidget {
  const HomeState({Key? key}) : super(key: key);

  @override
  State<HomeState> createState() => _HomeStateState();
}

class _HomeStateState extends State<HomeState> {

  int currentIndex = 0;

  final screens = <Widget>[
    Home(),
    // s
    SettingPage(),
    ProfileWrapper(),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.forum),
          //   label: 'Chats',
          //   backgroundColor: Color(0xFF210D41),
          // ),
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
      ),
    );
  }
}
