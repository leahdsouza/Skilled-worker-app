import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilled_worker_app/models/user.dart';
import 'package:skilled_worker_app/screens/authenticate/authenticate.dart';
import 'package:skilled_worker_app/screens/authenticate/create_new_account.dart';
import 'package:skilled_worker_app/screens/booking/booking.dart';
import 'package:skilled_worker_app/screens/profile/profile_wrapper.dart';
import 'package:skilled_worker_app/screens/settings/settings.dart';
import 'package:skilled_worker_app/screens/authenticate/login.dart';
import 'package:skilled_worker_app/screens/feedback/feedback.dart';
import 'package:skilled_worker_app/screens/help/help.dart';
import 'package:skilled_worker_app/screens/notifications/notifications.dart';
import 'package:skilled_worker_app/screens/register_worker/register_worker.dart';
import 'package:skilled_worker_app/screens/profile/profile.dart';
import 'package:skilled_worker_app/screens/home/home.dart';
import 'package:skilled_worker_app/screens/home/home_state.dart';
import 'package:skilled_worker_app/screens/worker_list/worker_list.dart';

import 'package:skilled_worker_app/screens/about/about.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String initial = '/homeState';


    final user = Provider.of<MyUser?>(context);





    if (user == null) {
      return Authenticate();
    } else {
      return MaterialApp(
        initialRoute: initial,

        routes: {
          '/registerWorker': (context) => RegisterWorker(),
          '/settings': (context) => SettingPage(),
          '/feedback': (context) => FeedbackPage(),
          '/help': (context) => HelpPage(),
          '/notifications': (context) => Notifications(),
          // '/profile': (context) => Profile(toggleView: ProfileWrapper.toggleView),
          '/profileWrapper': (context) => ProfileWrapper(),
          '/homeState': (context) => HomeState(),
          '/workerlist': (context) => WorkerListScreen(),
          '/about':(context) => About(),
          '/workerProfile':(context) => WorkerProfile(),
        },
      );
    }
  }
}