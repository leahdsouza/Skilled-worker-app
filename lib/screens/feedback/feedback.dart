import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:skilled_worker_app/screens/settings/settings.dart';
import 'package:skilled_worker_app/screens/authenticate/create_new_account.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:skilled_worker_app/shared/bottom_navigation.dart';
import 'package:skilled_worker_app/services/FeedbackDb.dart';

import '../../models/user.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {


  int currentIndex = 3;
  final screens = [
    // HomePage(),
    // ChatPage(),
    SettingPage(),
    // Profile(),
  ];
  String error = '';
  String feedbackText = '';
  late double ratingText ;
  final feedbackController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Feedback Added"),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF210D41),
        title: Text("Feedback", style: TextStyle(fontSize: 22 , color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30,80,30,0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Feedback!",
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                    onChanged: (val){
                      setState(() {
                        feedbackText = val;
                      });
                    },
                    validator: (String? val) {
                      if (val!.isEmpty){
                        return "Enter your feedback";
                      }
                      else{
                        return null;
                      }
                    },
                  decoration: InputDecoration(
                    hintText: 'Write Something!',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffececec),
                        width: 5.0
                      )
                    )
                  ),
                  minLines: 15,
                  keyboardType: TextInputType.multiline,
                  maxLines: 15,
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Rate Us!',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                ),
                SizedBox(height:10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {

                        ratingText = rating ;

                      });

                    },
                  ),
                ),
                SizedBox(height: 40,),
                TextButton(

                  style: ElevatedButton.styleFrom(
                      primary: Color(int.parse("0xff210d41")),
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 20)
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()){
                      final user = Provider.of<MyUser?>(context,listen: false);

                      FeedbackDb db = new FeedbackDb();

                      print("final .. ${ratingText}");

                      await db.updateFeedbackData(
                        feedbackText,
                        ratingText,
                        user?.uid
                      );
                      Future.delayed(Duration.zero, () => showAlert(context));
                      Navigator.pop(context, 'Feedback Added');
                    }
                  },
                ),
                SizedBox(height: 20,),
                Text(error,style: TextStyle(color: Colors.red,fontSize: 14.0),),

              ],
            ),
          ),
        ),

      ),
      // bottomNavigationBar: BottomNavigation()
    );;
  }
}


