import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:skilled_worker_app/pages/create_new_account.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int currentIndex = 3;
  final screens = [
    // HomePage(),
    // ChatPage(),
    SettingPage(),
    // Profile(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Settings", style: TextStyle(fontSize: 22 , color: Color(0xFF210D41), fontWeight: FontWeight.bold)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(

          padding: const EdgeInsets.all(0),
          child: SettingsList(
            sections: [
              SettingsSection(
                  tiles: [
                  SettingsTile(

                    title: Text('Register as Worker'),
                    leading: Icon(Icons.how_to_reg,
                        color: Color(0xFF210D41)),
                    onPressed: (BuildContext context) {
                      CreateAccount();
                    },
                  ),
                  SettingsTile(
                    title: Text('Notifications'),
                    leading: Icon(Icons.notifications,
                        color: Color(0xFF210D41)),
                    onPressed: (BuildContext context) {
                      Navigator.pushNamed(context, '/notifications');
                    },
                  ),
                  SettingsTile(
                    title: Text('Help'),
                    leading: Icon(Icons.help,
                        color: Color(0xFF210D41)),
                    onPressed: (BuildContext context) {
                      Navigator.pushNamed(context, '/help');
                    },
                  ),
                  SettingsTile(
                    title: Text('App Feedback'),
                    leading: Icon(Icons.feedback,
                        color: Color(0xFF210D41)),
                    onPressed: (BuildContext context) {
                      Navigator.pushNamed(context, '/feedback');
                    },
                  ),
                  SettingsTile(
                    title: Text('About'),
                    leading: Icon(Icons.info,
                        color: Color(0xFF210D41)),
                    onPressed: (BuildContext context) {
                      CreateAccount();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
      ),
    );
  }
}
