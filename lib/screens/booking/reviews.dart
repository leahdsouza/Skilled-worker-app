import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home/components/constant.dart';



class ReviewsCard extends StatelessWidget {
final Color color;
final String name;
final String description;
final double rating;



const ReviewsCard({
required this.color,
required this.name,
required this.description,
required this.rating,


});

@override
Widget build(BuildContext context) {
  return Card(
    elevation: 5,
    color: color,
    shape: kShape,
    child: Container(
      child: Row(
        children: <Widget>[
          // Expanded(
          //   child: Container(
          //     margin: EdgeInsets.all(10),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(10.0),
          //       // child: Image(
          //       //   image: image,
          //       //   height: 90.0,
          //       // ),
          //     ),
          //   ),
          // ),
          Expanded(

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[

              SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10,left: 10),
                  child: Text(
                    description,
                     style: TextStyle(fontSize: 16,
                          color: Colors.grey.shade300,
                          fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(top:10,left: 10,bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FaIcon(
                        FontAwesomeIcons.star,
                        color: Colors.black,
                        size: 15,
                        
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(rating.toString(), style: TextStyle(fontSize: 15,
                              color: Colors.grey.shade200,
                              fontWeight: FontWeight.bold),),
                      SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}