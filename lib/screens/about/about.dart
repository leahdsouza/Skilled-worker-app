import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF210D41),
          title: Text("About", style: TextStyle(fontSize: 22 , color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Text(
                "We intend to give an option to get job opportunities through the use of a mobile application. It aims to respond to the expected growing demand for skills as various sectors continue to develop, modernize, and grow. People will be able to find any type of skilled worker to work for them, in this way, the work of the customer is done quickly, and the worker gets paid for his job."
                ,style: TextStyle(
                 fontSize: 17,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.2
            ),
            ),


          ),

        )

    );
  }
}
