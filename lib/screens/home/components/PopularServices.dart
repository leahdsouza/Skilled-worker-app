import 'package:flutter/material.dart';
import 'package:skilled_worker_app/screens/home/components/ProductCard.dart';


import 'product_card.dart';
import 'section_tile.dart';
class PopularServices extends StatelessWidget {
  const PopularServices({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
            text: "Popular",
            press: () {}
        ),
        SizedBox(height: 20,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                    (index) => ProductCard(
                  product: demoProducts[index],
                ),
              ),
              SizedBox(width: 20,),
            ],
          ),
        ),
      ],
    );
  }
}

