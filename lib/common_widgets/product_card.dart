import 'package:dro_health_feature/color.dart';
import 'package:dro_health_feature/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product, required this.onTap})
      : super(key: key);
  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  product.productImage ?? '',
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                product.productName,
                style: const TextStyle(
                    fontFamily: proximaNova,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                product.productDesc,
                style: TextStyle(fontFamily: proximaNova),
              ),
              Text(
                '${product.productSubDesc} - ${product.productWeight}mg',
                style: TextStyle(fontFamily: proximaNova),
              ),
              Row(
                children: [
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: greyColor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2),
                      child: Text(
                        '\$${product.productPrice}',
                        style: TextStyle(fontFamily: proximaNova),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
