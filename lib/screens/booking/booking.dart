import 'dart:collection';
import '../home/components/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reviews.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkerProfile extends StatelessWidget {
  const WorkerProfile({Key? key}) : super(key: key);



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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30,),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile_image.webp'),
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
                        Text("${distance.toStringAsFixed(2)} Km",
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
                    'Customer Reviews',
                    style: kCategoryTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
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
                onPressed: (){

                },
              ),
            ],
          ),

              SizedBox(height: 20,),
              Column(
                children: [
                  ReviewsCard(
                    color: Color(0xffececec),
                    name: 'Jane Doe',
                    description: 'Good Service',
                    rating: 4.2,
                  ),
                  SizedBox(height: 10,),
                  ReviewsCard(
                    color: Color(0xffececec),
                    name: 'Sherlock ',
                    description: 'Excellent',
                    rating: 5.0,

                  ),
                ],
              ),

              SizedBox(height: 20,)
            ],
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