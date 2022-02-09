import 'package:flutter/material.dart';
import 'package:skilled_worker_app/pages/create_new_account.dart';
import 'package:skilled_worker_app/pages/settings.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',

    routes:{
      '/': (context)=> CreateAccount(),
      '/second': (context) => SettingPage(),
    },
  ));
}
