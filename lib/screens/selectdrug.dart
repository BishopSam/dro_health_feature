import 'package:dro_health_feature/color.dart';
import 'package:dro_health_feature/controllers/bagController.dart';
import 'package:dro_health_feature/controllers/controller.dart';
import 'package:dro_health_feature/models/bagcontent.dart';
import 'package:dro_health_feature/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectDrug extends StatelessWidget {
  SelectDrug({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Controller>();
    final cartController = Get.find<BagController>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () {
              controller.onClose();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          GetX<BagController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: droPurple,
                      backgroundColor: droPurple),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    '${cartController.bagCount}',
                    style: const TextStyle(
                        color: Colors.white, fontFamily: proximaNova),
                  )),
            );
          })
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Image.asset(
              product.productImage!,
              height: 200,
              fit: BoxFit.fill,
              width: 200,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            product.productName,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: proximaNova),
          ),
          Text(
            '${product.productSubDesc} - ${product.productWeight}mg',
            style: TextStyle(fontFamily: proximaNova),
          ),
          const SizedBox(
            height: 10,
          ),
          _buildProductSeller(product, controller),
          const SizedBox(
            height: 10,
          ),
          _buildProductQuantity(product, controller),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'PRODUCT DETAILS',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 15, color: greyColor, fontFamily: proximaNova),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildProductDetails(product),
          ),
        ]),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Add to Bag',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          onPressed: () {
            cartController.addBagContent(BagContent(
                product: product,
                quantity: controller.quantity.toInt(),
                totalPrice:
                    controller.quantity.toInt() * product.productPrice));
            controller.onClose();
            Get.back();
          },
        ),
      ),
    );
  }

  Widget _buildProductSeller(Product product, Controller controller) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: greyColor,
          radius: 25,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SOLD BY',
              style: TextStyle(color: greyColor, fontFamily: proximaNova),
            ),
            Text(
              product.productSeller,
              style: TextStyle(fontFamily: proximaNova),
            )
          ],
        )
      ],
    );
  }

  Widget _buildProductQuantity(Product product, Controller controller) {
    return Row(
      children: [
        _buildNumberofItems(controller.count, controller),
        const SizedBox(
          width: 5,
        ),
        const Text(
          'Pack(s)',
          style: TextStyle(fontFamily: proximaNova),
        ),
        const Spacer(),
        Text(
          '\$${product.productPrice.toString()}',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: proximaNova),
        )
      ],
    );
  }

  Widget _buildNumberofItems(int bagItemCount, Controller controller) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: greyColor,
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
            const SizedBox(
              width: 2,
            ),
            GetX<Controller>(builder: (_) {
              return Text(
                controller.quantity.toString(),
                style: const TextStyle(
                    color: Colors.black, fontFamily: proximaNova),
              );
            }),
            IconButton(
                onPressed: () => controller.incrementQuantity(),
                icon: const Icon(Icons.add)),
          ],
        ));
  }

  Widget _buildProductDetails(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductDescItem(product.productPackSize, 'PACK SIZE',
                Icons.medication_liquid_outlined),
            const SizedBox(
              height: 5,
            ),
            _buildProductDescItem(
                product.productSubDesc, 'CONSTITUENTS', Icons.medication),
            const SizedBox(
              height: 5,
            ),
            _buildProductDescItem(product.dispensedIn, 'DISPENSED IN',
                Icons.delivery_dining_rounded),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductDescItem(product.productID ?? '', 'PRODUCT ID',
                Icons.qr_code_scanner_rounded),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProductDescItem(
      String productDetail, String itemName, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: droPurple,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemName,
              style: const TextStyle(
                  color: greyColor, fontSize: 12, fontFamily: proximaNova),
            ),
            Text(
              productDetail,
              style: TextStyle(fontFamily: proximaNova),
            )
          ],
        )
      ],
    );
  }
}
