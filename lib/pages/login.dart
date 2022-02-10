import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('images/LoginBg.png'),
                  fit: BoxFit.cover,
              )
            ),
          ),
          Positioned(
            top: 120,
            left: 30,
            right: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.supervised_user_circle,
                  color: Colors.white,
                  size: 120
                ),
                Text(
                    'Welcome!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                    ),
                ),
                SizedBox(height: 40,),
                Container(
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(int.parse(("0xffececec"))),width: 2.0),
                      ),
                      hintText: '91 | Mobile Number',
                      fillColor: Color(int.parse(("0xffececec"))),
                      filled: true,


                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(int.parse(("0xffececec"))),width: 2.0),
                      ),
                      hintText: 'Enter OTP',
                      fillColor: Color(int.parse(("0xffececec"))),
                      filled: true,


                    ),
                  ),

                ),
                SizedBox(height: 0,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(250,0,0,10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 12,color: Colors.black),

                    ),
                    onPressed: (){},
                    child: Text('Resend OTP'),
                  ),
                ),
                TextButton(

                  style: ElevatedButton.styleFrom(
                      primary: Color(int.parse("0xff210d41")),
                      padding: EdgeInsets.fromLTRB(40, 20, 40, 20)
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
