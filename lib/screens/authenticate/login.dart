import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_worker_app/shared/loading.dart';
import 'package:skilled_worker_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skilled_worker_app/models/user.dart';
import 'package:skilled_worker_app/services/database.dart';


class Login extends StatefulWidget {

  final Function toggleView;

  Login({required this.toggleView});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService authService = AuthService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();

  bool loading = false;

  // String email = '';
  //
  // String password = '';
  //
  // String error = '';

  String phone = '';
  String otp = '';

  String verificationIDReceived = "";

  bool otpCodeVisible = false;

  void verifyNumber  (){
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async{
          await _auth.signInWithCredential(credential).then((value){
            print("You are logged in Successfully");
          });
        },
        verificationFailed: (FirebaseAuthException exception){
          print(exception.message);
        },
        codeSent: (String verificationId, int? resendToken){
          verificationIDReceived = verificationId;
          otpCodeVisible = true;
          setState(() {

          });
        },
        codeAutoRetrievalTimeout: (String verificationID){

        }
    );

  }

  void verifyCode() async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationIDReceived, smsCode: otp);

    UserCredential userCredential =await _auth.signInWithCredential(credential);

    User user = userCredential.user!;

    MyUser? new_user = authService.userFromFirebase(user)!;

    await DatabaseService(uid: new_user.uid).updateUserData(" ", " ", phone);

  }


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
                      keyboardType: TextInputType.phone,
                      onChanged: (val){
                        setState(() {
                          phone = val;
                        });
                      },
                      // validator: (String? val) {
                      //   if (val!.isEmpty){
                      //     return "Enter an email";
                      //   }
                      //   else{
                      //     return null;
                      //   }
                      // } ,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(int.parse(("0xffececec"))),width: 2.0),
                        ),
                        hintText: 'Phone Number',
                        fillColor: Color(int.parse(("0xffececec"))),
                        filled: true,


                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Visibility(
                    visible: otpCodeVisible,
                    child: Container(
                      width: 350,
                      child: TextFormField(
                        obscureText: true,
                        onChanged: (val){
                          setState(() {
                            otp = val;
                          });

                        },
                        // validator: (String? val) => val!.length < 6 ? "Enter a password with chars >6": null,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(int.parse(("0xffececec"))),width: 2.0),
                          ),
                          hintText: 'OTP',
                          fillColor: Color(int.parse(("0xffececec"))),
                          filled: true,


                        ),
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
                      otpCodeVisible? "Login" : "Verify",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: () async {

                      if (otpCodeVisible){
                        verifyCode();
                      }else{
                        verifyNumber();
                      }

                      verifyNumber();
                      // if (_formkey.currentState!.validate()){
                      //
                      //   setState(() {
                      //     loading = true;
                      //   });
                      //   dynamic result =await _auth.signInWithEmailAndPassword(email, password);
                      //
                      //   if (result == null ){
                      //     setState(() {
                      //
                      //       error = "Could not sign in , Try again !";
                      //       loading = false;
                      //     });
                      //   }
                      //
                      // }

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
