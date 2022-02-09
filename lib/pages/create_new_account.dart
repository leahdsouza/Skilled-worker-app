import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  color: Color(int.parse("0xff7fcaed")),
                  child:Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40.0,70.0,40.0,0),

                        child: Text(
                            'Create New Account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40
                            ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Text(
                        'Already a User?',
                        textAlign: TextAlign.center,
                      ),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 12,color: Colors.black),

                          ),
                          onPressed: (){},
                          child: Text('Sign in to Continue'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 280,
              left: 30,
              right: 30,

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,280,5),
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
                        hintText: 'NAME',
                        fillColor: Color(int.parse(("0xffececec"))),
                        filled: true,


                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(int.parse("0xff210d41"))
                    ),
                    child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                    ),
                    onPressed: () {},
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
