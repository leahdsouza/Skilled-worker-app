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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(aspectRatio: aspectRetion,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(product.images[0],fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              product.name,
              style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 18,),
            ),
            SizedBox(height: 1,),
            Text(
              product.title,
              style: TextStyle(color: Colors.black87,letterSpacing: 0.8),
              maxLines: 2,

            ),
            Text(
              "\₹${product.price}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF210D41),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

