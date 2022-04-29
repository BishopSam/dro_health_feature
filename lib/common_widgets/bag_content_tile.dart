import 'package:dro_health_feature/color.dart';
import 'package:dro_health_feature/models/bagcontent.dart';
import 'package:flutter/material.dart';

class BagContentTile extends StatelessWidget {
  const BagContentTile({Key? key, required this.bagContent}) : super(key: key);
  final BagContent bagContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
      child: Row(
        children: [
          ClipRRect(
            child: Image.asset(
              bagContent.product.productImage!,
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            '${bagContent.quantity.toString()}X',
            style:
                const TextStyle(color: Colors.white, fontFamily: proximaNova),
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bagContent.product.productName,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontFamily: proximaNova, color: Colors.white),
              ),
              Text(
                bagContent.product.productSubDesc,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontFamily: proximaNova, color: Colors.white),
              )
            ],
          ),
          const Spacer(),
          Text(
            '\$${bagContent.totalPrice.toString()}',
            style:
                const TextStyle(fontFamily: proximaNova, color: Colors.white),
          )
        ],
      ),
    );
  }
}
