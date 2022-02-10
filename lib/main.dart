
import 'package:flutter/material.dart';
import 'package:skilled_worker_app/pages/create_new_account.dart';
import 'package:skilled_worker_app/pages/settings.dart';
import 'package:skilled_worker_app/pages/login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',

    routes:{
      '/login': (context) => Login(),
      '/': (context)=> CreateAccount(),
      '/second': (context) => SettingPage(),
    },
  ));
}
