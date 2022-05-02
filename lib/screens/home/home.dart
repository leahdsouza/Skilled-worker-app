import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_worker_app/screens/home/components/categories.dart';
import 'package:skilled_worker_app/shared/bottom_navigation.dart';
import 'package:skilled_worker_app/screens/home/components/PopularServices.dart';

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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,5,20,5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Services',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),

                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Text(
                          "See More",
                          style: TextStyle(color: Color(0xFFBBBBBB)),
                        ),
                      ),
                    ],
                  ),
                ),
                Categories(),
                PopularProducts(),

              ],
            ),
          ),
        ),
      // bottomNavigationBar: BottomNavigation(currentIndex: 0,),
    );
  }
}

