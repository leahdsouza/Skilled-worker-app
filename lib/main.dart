
import 'package:flutter/material.dart';
import 'package:skilled_worker_app/pages/create_new_account.dart';
import 'package:skilled_worker_app/pages/settings.dart';
import 'package:skilled_worker_app/pages/login.dart';
import 'package:skilled_worker_app/pages/feedback.dart';
import 'package:skilled_worker_app/pages/help.dart';
import 'package:skilled_worker_app/pages/notifications.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',

    routes:{
      '/login': (context) => Login(),
      '/': (context)=> CreateAccount(),
      '/settings': (context) => SettingPage(),
      '/feedback': (context) => FeedbackPage(),
      '/help': (context) => HelpPage(),
      '/notifications': (context) => Notifications()
    },
  ));
}
