import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:skilled_worker_app/pages/settings.dart';
import 'package:skilled_worker_app/pages/create_new_account.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {


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
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF210D41),
        title: Text("Feedback", style: TextStyle(fontSize: 22 , color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30,80,30,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Feedback!",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(

                decoration: InputDecoration(
                  hintText: 'Write Something!',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffececec),
                      width: 5.0
                    )
                  )
                ),
                minLines: 15,
                keyboardType: TextInputType.multiline,
                maxLines: 15,
              ),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rate Us!',
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
              ),
              SizedBox(height:10),
              Align(
                alignment: Alignment.centerLeft,
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              SizedBox(height: 40,),
              TextButton(

                style: ElevatedButton.styleFrom(
                    primary: Color(int.parse("0xff210d41")),
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 20)
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: () {

                },
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
    );;
  }
}


