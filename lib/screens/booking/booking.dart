import 'dart:collection';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:skilled_worker_app/models/user_detail.dart';

import '../../models/user.dart';
import '../../services/database.dart';
import '../../shared/loading.dart';
import '../home/components/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reviews.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:skilled_worker_app/services/workerDb.dart';

class WorkerProfile extends StatefulWidget {


  static final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  State<WorkerProfile> createState() => _WorkerProfileState();
}

class _WorkerProfileState extends State<WorkerProfile> {
  final reviewController = TextEditingController();
  late double ratingText ;

  Future<List> getReviewsList() async {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    String name = arg["name"];

    WorkerDb db = new WorkerDb();
    var docID = await db.getWorker(name);
    print(docID);

    List reviewList = await db.getAllReviews(docID);
    print(reviewList);
    return reviewList;
  }

  @override
  Widget build(BuildContext context) {

    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    String category = arg["category"];
    int rate = arg["rate"];
    String address = arg["address"];
    double distance = arg["distance"];
    String name = arg["name"];


    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: Form(
            key: WorkerProfile._formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30,),
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/image_profile.png'),
                    radius: 60,
                  ),
                ),
                SizedBox(height: 30,),
                Text('Skills: ${category}',
                  style: TextStyle(
                      color: Color(0xFF210D41),
                      letterSpacing: 2.0,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),

                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                       Expanded(
                         flex: 4,
                         child: Column(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("${name}",
                                style: TextStyle(
                                  color: Color(0xFF210D41),
                                  letterSpacing: 2.0,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,),),
                                Text("${address}",

                                    style: TextStyle(
                                      color: Color(0xFF210D41),
                                      letterSpacing: 2.0,
                                      fontSize: 15,
                                      ),),
                              ],
                            )
                          ],
                      ),
                       ),
                  SizedBox(width: 40,),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.location_on_sharp,color: Colors.amber,
                          size: 30,),
                          Text( distance == 0.0 ? "":"${distance.toStringAsFixed(2)} Km",
                            style: TextStyle(
                            color: Color(0xFF210D41),
                            letterSpacing: 1.0,
                            fontSize: 15,
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50,),
                Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF210D41),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('₹ 100',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                          Text('per hour',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                        ],
                        ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xffececec),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('₹${rate}',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                          Text('per day',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Color(0xFF210D41),
                    textColor: Colors.white,
                    child: Text('Book Now'),
                    padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0,),
                    onPressed: (){
                      _makePhoneCall('tel:0597924917');
                    },
                  ),
                ),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Write Review',
                      style: kCategoryTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
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

                        // print(rating);
                        ratingText = rating ;

                      });

                    },
                  ),
                ),
                TextFormField(
                  validator: (String? val) {
                    if (val!.isEmpty){
                      return "Enter your Review";
                    }
                    else{
                      return null;
                    }
                  } ,
                  controller: reviewController,
                  decoration: InputDecoration(
                    hintText: "Write Reviews",
                    labelStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: false,
                ),
            SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end
              ,
              children: [
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Color(0xFF210D41),
                  textColor: Colors.white,
                  child: Text('Post'),
                  padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0,),
                  onPressed: () async {
                      if (WorkerProfile._formkey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();

                        final user = Provider.of<MyUser?>(context,listen: false);
                        DatabaseService userdb = new DatabaseService(uid: user?.uid);
                        UserDetail currentUser = await userdb.getUser();

                        print(reviewController.text);
                        WorkerDb db = new WorkerDb();
                        var docID = await db.getWorker(name);
                        print(docID);
                        await db.addReview(docID, reviewController.text, currentUser.name,ratingText);
                        print(ratingText);
                        reviewController.text = '';
                        setState(() {

                        });



                }
                  },
                ),
              ],
            ),

                SizedBox(height: 20,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Customer Reviews',
                      style: kCategoryTextStyle,
                    ),
                  ],
                ),



                Column(
                  children: [
                    FutureBuilder<List>(
                        future: getReviewsList(), // function where you call your api
                        builder: (BuildContext context, AsyncSnapshot<List> snapshot) { // AsyncSnapshot<Your object type>
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Loading();
                          }
                          else {
                            if (snapshot.hasError) {
                              return Center(child: Text('Error: ${snapshot.error}'));
                            }
                            else {

                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount:snapshot.data?.length,
                                itemBuilder: (context,index){
                                  return  ReviewsCard(
                                    color: Color(0xffececec),
                                    name: snapshot.data![index]['username'],
                                    description: snapshot.data![index]['review'],
                                    rating: snapshot.data![index]['rating'] == null ? 3.0 : snapshot.data![index]['rating'],
                                  );
                                },
                              );
                            }}}),
                  ],
                ),

                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),


    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }}
}