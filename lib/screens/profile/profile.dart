import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF210D41),
        title: Text('Profile',
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child:Column(
                    children: [
                      Container(

                      child: Icon(
                        Icons.supervised_user_circle,
                        size: 100,
                      ),
                      //   padding: EdgeInsets.all(10.0),
                      //
                      //   width: MediaQuery.of(context).size.width/4,
                      //   height: MediaQuery.of(context).size.width/4,
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.white,width: 5),
                      //     shape: BoxShape.circle,
                      //     color: Colors.white,
                      //     image: DecorationImage(
                      //       fit: BoxFit.cover,
                      //       image: AssetImage('assets/profile_image.webp'),
                      //     ),
                      //   ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Positioned(
              top: 100,
              left: 30,
              right: 30,

              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,30,280,5),
                    child: Text(
                      'NAME',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: 600,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(int.parse(("0xffececec"))),width: 2.0),
                        ),
                        hintText: 'Antonio Savic',
                        fillColor: Color(int.parse(("0xffececec"))),
                        filled: true,


                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,20,280,5),
                    child: Text(
                      'EMAIL',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: 600,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(int.parse(("0xffececec"))),width: 2.0),
                        ),
                        hintText: 'antsav@gmail.com',
                        fillColor: Color(int.parse(("0xffececec"))),
                        filled: true,


                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,20,220,5),
                    child: Text(
                      'PHONE NUMBER',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: 600,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(int.parse(("0xffececec"))),width: 2.0),
                        ),
                        hintText: '91 | 9876543211',
                        fillColor: Color(int.parse(("0xffececec"))),
                        filled: true,


                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,20,270,5),
                    child: Text(
                      'ADDRESS',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: 600,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(int.parse(("0xffececec"))),width: 2.0),
                        ),
                        hintText: 'Spain',
                        fillColor: Color(int.parse(("0xffececec"))),
                        filled: true,


                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  TextButton(

                      style: ElevatedButton.styleFrom(
                          primary: Color(int.parse("0xff210d41")),
                          padding: EdgeInsets.fromLTRB(40, 20, 40, 20)
                      ),
                      child: Text(
                        "EDIT",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: () {}

                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}