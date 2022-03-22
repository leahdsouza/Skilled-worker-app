
import 'package:flutter/material.dart';
import 'package:skilled_worker_app/screens/authenticate/create_new_account.dart';
import 'package:skilled_worker_app/screens/settings/settings.dart';
import 'package:skilled_worker_app/screens/authenticate/login.dart';
import 'package:skilled_worker_app/screens/feedback/feedback.dart';
import 'package:skilled_worker_app/screens/help/help.dart';
import 'package:skilled_worker_app/screens/notifications/notifications.dart';
import 'package:skilled_worker_app/screens/register_worker/register_worker.dart';
import 'package:skilled_worker_app/screens/profile/profile.dart';
import 'package:skilled_worker_app/screens/home/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',

    routes:{
      '/registerWorker':(context) => RegisterWorker(),
      '/login': (context) => Login(),
      '/': (context)=> CreateAccount(),
      '/settings': (context) => SettingPage(),
      '/feedback': (context) => FeedbackPage(),
      '/help': (context) => HelpPage(),
      '/notifications': (context) => Notifications(),
      '/profile':(context) => Profile(),
      '/home': (context) => Home()
    },
  ));
}
