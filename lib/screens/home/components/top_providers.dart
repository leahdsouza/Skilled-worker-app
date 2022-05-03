import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'freelancer_card.dart';

class Top_Providers extends StatelessWidget {
  const Top_Providers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        children: [
          FreelancerCard(
            color: Colors.amber,
            name: 'Jane Doe',
            image: AssetImage(
              'assets/images/consultant.jpg',
            ),
            description: 'Investment Consultant',
            rating: 5.0,
            comments: 15,
          ),
          FreelancerCard(
        color: Color(0xffb8c1ff),
        name: 'Sherlock Holmes',
        image: AssetImage(
          'assets/images/sherlock.jpg',
        ),
        description: 'Consulting Detective',
        rating: 5.0,
        comments: 15,
      ),
      FreelancerCard(
        color: Color(0xffffb8fa),
        name: 'Dasha Taraan',
        image: AssetImage(
          'assets/images/taraan.jpg',
        ),
        description: 'Model',
        rating: 5.0,
        comments: 15,
      ),
      FreelancerCard(
        color: Color(0xffffb8fa),
        name: 'Joker',
        image: AssetImage(
          'assets/images/joker.jpg',
        ),
        description: 'Joker',
        rating: 5.0,
        comments: 15,
      ),
        ],
      ),
    );
  }
}