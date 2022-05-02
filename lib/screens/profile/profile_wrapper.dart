import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilled_worker_app/screens/authenticate/create_new_account.dart';
import 'package:skilled_worker_app/screens/authenticate/login.dart';
import 'package:skilled_worker_app/screens/profile/SavedProfile.dart';
import 'package:skilled_worker_app/screens/profile/profile.dart';

import '../../models/user.dart';
import '../../models/user_detail.dart';
import '../../services/database.dart';
import '../../shared/loading.dart';



class ProfileWrapper extends StatefulWidget {
  const ProfileWrapper({Key? key}) : super(key: key);

  @override
  State<ProfileWrapper> createState() => _ProfileWrapperState();
}

class _ProfileWrapperState extends State<ProfileWrapper> {

  bool showEditProfile = false;

  void toggleView(){
    setState(() {
      showEditProfile = !showEditProfile;
    });
  }

  Future<UserDetail> getCurrentUser() async {
    final user = Provider.of<MyUser?>(context);
    DatabaseService db = new DatabaseService(uid: user?.uid);
    return await db.getUser();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<UserDetail>(
        future: getCurrentUser(), // function where you call your api
        builder: (BuildContext context, AsyncSnapshot<UserDetail> snapshot) { // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            else {
                if(snapshot.data?.name ==' ' || snapshot.data?.address == ' '|| showEditProfile==true){
                  return Profile(toggleView: toggleView);
                }
                else{
                  return SavedProfile(toggleView: toggleView);
                }
                }

            }
        }

  );
}}