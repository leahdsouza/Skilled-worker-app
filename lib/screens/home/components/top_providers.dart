import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../booking/reviews.dart';
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
          ReviewsCard(
                     color: Colors.grey.shade500,
                    name: 'Jane Doe',
                    description: 'Good Service',
                    rating: 4.2,
                  ),
        ReviewsCard(
                    color: Colors.grey.shade500,
                    name: 'John',
                    description: 'Good Service',
                    rating: 4.0,
                  ),
        ReviewsCard(
                      color: Colors.grey.shade500,
                    name: 'Sanjay',
                    description: 'Excellent',
                    rating: 5.0,
                  ),
       ReviewsCard(
                     color: Colors.grey.shade500,
                    name: 'Rahul',
                    description: 'Good Service',
                    rating: 4.1,
                  ),
        ],
      ),
    );
  }
}