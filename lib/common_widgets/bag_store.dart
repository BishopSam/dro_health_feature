import 'package:dro_health_feature/common_widgets/bag_content_tile.dart';
import 'package:dro_health_feature/controllers/bagController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BagStore extends StatelessWidget {
  const BagStore({
    Key? key,
    required this.context,required this.controller,
  }) : super(key: key);
  final BuildContext context;
  final ScrollController controller;

  @override
  Widget build(context) {
    final cartController = Get.find<BagController>();
    return ListView.builder(
      controller: controller,
      itemCount: cartController.bagCount,
      itemBuilder: (context, index) {
        return BagContentTile(
          bagContent: cartController.cart[index],
        );
      },
    );
  }
}
