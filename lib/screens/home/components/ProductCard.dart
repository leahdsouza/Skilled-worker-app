import 'package:flutter/material.dart';

import 'product_card.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetion = 1.02,
    required this.product ,
  }) : super(key: key);

  final double width, aspectRetion;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            AspectRatio(aspectRatio: aspectRetion,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(product.images[0]),
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              product.title,
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\₹${product.price}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: product.isFavourite
                          ? Colors.black.withOpacity(0.15)
                          : Colors.black.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset( "assets/icons/Heart Icon_2.svg",
                      color: product.isFavourite
                          ? Color(0xFFFF4848)
                          : Color(0xFFDBDEE4),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

