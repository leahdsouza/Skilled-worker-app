import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_worker_app/screens/home/components/categories.dart';
import 'package:skilled_worker_app/screens/home/components/product_card.dart';
import 'package:skilled_worker_app/shared/bottom_navigation.dart';
import 'package:skilled_worker_app/screens/home/components/PopularServices.dart';

import 'components/SpecialOffer.dart';
import 'components/section_tile.dart';



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
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/cleaning.jpg',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'We clean like',
                        style: TextStyle(
                          color: Color(0xff040f48),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Never',
                            style: TextStyle(
                              color: Color(0xff040f48),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Been Dirty',
                            style: TextStyle(
                              color: Color(0xffe2345d),
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        color: Color(0xff040f48),
                        // shape: kShape,
                        onPressed: () {},
                        child: const Text(
                          'Book now',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,5,20,5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Home Services',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),

                    ),

                  ],
                ),
              ),
              Categories(),
              // PopularProducts(),
              SizedBox(height: 20,),
              SpecialOffer(),
              SizedBox(height: 30,),
              PopularServices(),
              SizedBox(height: 30,),

            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}

