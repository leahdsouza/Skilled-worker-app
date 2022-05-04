import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_worker_app/screens/home/components/categories.dart';
import 'package:skilled_worker_app/screens/home/components/product_card.dart';
import 'package:skilled_worker_app/shared/bottom_navigation.dart';
import 'package:skilled_worker_app/screens/home/components/PopularServices.dart';

import 'components/SpecialOffer.dart';
import 'components/TopContainer.dart';
import 'components/constant.dart';
import 'components/freelancer_card.dart';
import 'components/section_tile.dart';

import 'components/top_providers.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20,20,20,10),
                child: Row(
                  children: [
                    Container(
                      width: 350,
                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        onChanged: (value) => print(value),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "Search product",
                            prefixIcon: Icon(Icons.search)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              TopContainer(),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,5,20,5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Home Services',
                      style: TextStyle(fontSize: 20,
                          color: Color(0xff626262),
                          fontWeight: FontWeight.w600,
                          ),

                    ),

                  ],
                ),
              ),
              Categories(),
              // PopularProducts(),
              SizedBox(height: 10,),
              SpecialOffer(),
              SizedBox(height: 20,),
              SpecialOffer(),
              SizedBox(height: 30,),
              PopularServices(),
              SizedBox(height: 20,),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Customer Reviews',
                          // style: kCategoryTextStyle,
                          style: TextStyle(fontSize: 20,
                          color: Color(0xff626262),
                          fontWeight: FontWeight.w600,
                          ),
                          
                        ),
                      ],
                    ),
              ),
                  SizedBox(
                    height: 10,
                  ),
                  Top_Providers(),
                  
                ],
              ),
            ),

            
          ),
    );
      
      // bottomNavigationBar: BottomNavigation(),
    
  }
}

