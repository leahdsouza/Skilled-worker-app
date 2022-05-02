
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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:skilled_worker_app/services/auth.dart';
import 'package:skilled_worker_app/models/user.dart';
import 'package:skilled_worker_app/screens/wrapper.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
