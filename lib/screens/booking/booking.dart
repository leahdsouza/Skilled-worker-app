import 'dart:collection';
import '../home/components/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reviews.dart';

void main() => runApp(MaterialApp(
  home: Profile(),
));
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Text('Skills: Plumber',
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

                     Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Cahaya Dewi",
                            style: TextStyle(
                              color: Color(0xFF210D41),
                              letterSpacing: 2.0,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,),),
                            Text("123 Anywhere St.Any City",
                                style: TextStyle(
                                  color: Color(0xFF210D41),
                                  letterSpacing: 2.0,
                                  fontSize: 15,
                                  ),),
                          ],
                        )
                      ],
                    ),
                SizedBox(width: 30,),
                  Column(
                    children: <Widget>[
                      Icon(Icons.star,color: Colors.amber,
                      size: 30,),
                      Text("5.0 Rates",
                        style: TextStyle(
                        color: Color(0xFF210D41),
                        letterSpacing: 1.0,
                        fontSize: 15,
                      ),)
                    ],
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
                        Text('₹ 500',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
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
                  onPressed: (){},
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
                obscureText: true,
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
                onPressed: (){},
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
}