import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_worker_app/models/user_detail.dart';
import 'package:skilled_worker_app/services/database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:skilled_worker_app/models/user.dart';
import 'package:skilled_worker_app/shared/loading.dart';



class Profile extends StatefulWidget {

  final Function toggleView;

  Profile({required this.toggleView });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  bool loading = false;
  String name = '',
      address = '',
      error = '',
      phoneNumber = '';

  final _formkey = GlobalKey<FormState>();
  final addressController = TextEditingController();
  final nameController = TextEditingController();

  Future<UserDetail> getCurrentUser() async {
    final user = Provider.of<MyUser?>(context);
    DatabaseService db = new DatabaseService(uid: user?.uid);
    return await db.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserDetail>(
      future: getCurrentUser(), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<
          UserDetail> snapshot) { // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        } else {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          else {
            return loading? Loading():Scaffold(
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

                      child: Form(
                        key: _formkey,
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
                              child: TextFormField(
                                controller: nameController,

                                // onChanged: (val){
                                //   setState(() {
                                //     name = val;
                                //   });
                                // },
                                validator: (String? val) {
                                  if (val!.isEmpty){
                                    return "Enter your Name";
                                  }
                                  else{
                                    return null;
                                  }
                                } ,

                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(int.parse(("0xffececec"))),width: 2.0),
                                  ),
                                  hintText: '${snapshot.data?.name}',
                                  fillColor: Color(int.parse(("0xffececec"))),
                                  filled: true,


                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(0,20,280,5),
                            //   child: Text(
                            //     'EMAIL',
                            //     textAlign: TextAlign.start,
                            //   ),
                            // ),
                            // Container(
                            //   width: 600,
                            //   child: TextField(
                            //     decoration: InputDecoration(
                            //       enabledBorder: OutlineInputBorder(
                            //         borderSide: BorderSide(color: Color(int.parse(("0xffececec"))),width: 2.0),
                            //       ),
                            //       hintText: 'antsav@gmail.com',
                            //       fillColor: Color(int.parse(("0xffececec"))),
                            //       filled: true,
                            //
                            //
                            //     ),
                            //   ),
                            // ),
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
                                  hintText: '${snapshot.data?.phoneNumber}',
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
                              child: TextFormField(
                                controller: addressController,
                                // onChanged: (val){
                                //   setState(() {
                                //     address = val;
                                //   });
                                // },
                                validator: (String? val) {
                                  if (val!.isEmpty){
                                    return "Enter your Address";
                                  }
                                  else{
                                    return null;
                                  }
                                } ,

                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(int.parse(("0xffececec"))),width: 2.0),
                                  ),
                                  hintText: '${snapshot.data?.address}',
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
                                  "SAVE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                onPressed: () async{

                                  if (snapshot.data?.name != ' ' && snapshot.data?.address != ' '){
                                    addressController.text = '${snapshot.data?.address}';
                                    nameController.text = '${snapshot.data?.name}';

                                  }

                                  if (_formkey.currentState!.validate()){

                                    // setState(() {
                                    //   loading = true;
                                    // });

                                    print(addressController.text);
                                    print(nameController.text);

                                    final user = Provider.of<MyUser?>(context,listen: false);

                                    print(user?.uid);

                                    await DatabaseService(uid: user?.uid).updateUserData(addressController.text, nameController.text, '${snapshot.data?.phoneNumber}');

                                    widget.toggleView();
                                    // if (result == null ){
                                    //   setState(() {
                                    //     error = "Enter valid Email";
                                    //     loading = false;
                                    //   });
                                    // }

                                  }


                                }

                            ),
                            SizedBox(height: 20,),
                            Text(error,style: TextStyle(color: Colors.red,fontSize: 14.0),),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ); // snapshot.data  :- get your object which is pass from your downloadData() function
          }}
      },
    );
  }
}