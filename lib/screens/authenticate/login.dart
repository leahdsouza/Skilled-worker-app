import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_worker_app/shared/loading.dart';
import 'package:skilled_worker_app/services/auth.dart';

class Login extends StatefulWidget {

  final Function toggleView;

  Login({required this.toggleView});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _auth = AuthService();

  final _formkey = GlobalKey<FormState>();

  bool loading = false;

  String email = '';

  String password = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('assets/images/LoginBg.png'),
                  fit: BoxFit.cover,
              )
            ),
          ),
          Positioned(
            top: 120,
            left: 30,
            right: 30,
            child: Form(
              key: _formkey,
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
                    child: TextFormField(
                      onChanged: (val){
                        setState(() {
                          email = val;
                        });
                      },
                      validator: (String? val) {
                        if (val!.isEmpty){
                          return "Enter an email";
                        }
                        else{
                          return null;
                        }
                      } ,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(int.parse(("0xffececec"))),width: 2.0),
                        ),
                        hintText: 'Email',
                        fillColor: Color(int.parse(("0xffececec"))),
                        filled: true,


                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 350,
                    child: TextFormField(
                      obscureText: true,
                      onChanged: (val){
                        setState(() {
                          password = val;
                        });

                      },
                      validator: (String? val) => val!.length < 6 ? "Enter a password with chars >6": null,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(int.parse(("0xffececec"))),width: 2.0),
                        ),
                        hintText: 'Password',
                        fillColor: Color(int.parse(("0xffececec"))),
                        filled: true,


                      ),
                    ),

                  ),
                  SizedBox(height: 30,),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(200,0,0,10),
                  //   child: TextButton(
                  //     style: TextButton.styleFrom(
                  //       textStyle: const TextStyle(fontSize: 12,color: Colors.black),
                  //
                  //     ),
                  //     onPressed: (){},
                  //     child: Text('Create New Account ',
                  //       style: TextStyle(
                  //         color: Color(int.parse("0xff210d41")),
                  //         fontSize: 16
                  //       ),
                  //
                  //     ),
                  //   ),
                  // ),
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
                    onPressed: () async {

                      if (_formkey.currentState!.validate()){

                        setState(() {
                          loading = true;
                        });
                        dynamic result =await _auth.signInWithEmailAndPassword(email, password);

                        if (result == null ){
                          setState(() {

                            error = "Could not sign in , Try again !";
                            loading = false;
                          });
                        }

                      }

                    },
                  ),
                  SizedBox(height: 10,),
                  Divider(
                    color: Colors.black,
                    height: 20,
                    thickness: 2,
                    indent: 70,
                    endIndent: 70,
                  ),
                  Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,30,20),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 12,color: Colors.black),

                    ),
                    onPressed:(){
                      widget.toggleView();
                    },

                    child: Text('''
                    Dont have an Account ?
                    Create New Account ''',
                      style: TextStyle(
                        color: Color(int.parse("0xff210d41")),
                        fontSize: 16
                      ),

                    ),
                  ),
                ),

                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
