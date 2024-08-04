import 'package:flutter/material.dart';
// import 'package:shopping_mall/components/products.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String image;
  final double price;
  final Color backgroundcolor;
  const ProductCard({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.backgroundcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundcolor,
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),

      // decoration: BoxDecoration(
      //     color: Colors.grey[150], borderRadius: BorderRadius.circular(15)),
      // child: Column(
      //   children: [
      //     Container(
      //         // width: double.infinity,
      //         // height: 200,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //         ),
      //         child: Icon(Icons.heart_broken)),
      //     Text(title)
      //   ],
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "\$$price",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              image,

              height: 175,
              // width: 1000,
            ),
          ),
        ],
      ),
    );
  }
}
