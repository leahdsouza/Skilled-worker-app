import 'package:flutter/material.dart';

import 'section_tile.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "    Special for you  ",
          style: TextStyle(fontSize: 20,
                          color: Color(0xff626262),
                          fontWeight: FontWeight.w600,
                          ),
          
          
        ),
        SizedBox(height: 20,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/Carpenter.jpg",
                category: "Carpenter",
                location: "Mumbai",
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/Painter.jpg",
                category: "Painter",
                location: "Mumbai",
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/electrician.jpg",
                category: "Electrician",
                location: "Mumbai",
                press: () {

                  Navigator.pushNamed(context, '/workerlist',arguments: {
                    'category': "Electrician"
                  });

                },
              ),
              SizedBox(width: 20,),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.location,
    required this.press,
  }) : super(key: key);

  final String category,image;
  final String location;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 152,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  width: 162,
                  height: 100,
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF343434).withOpacity(0.4),
                            Color(0xFF343434).withOpacity(0.15),
                          ])
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10),
                  child: Text.rich(TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$location"),
                      ]
                  ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

