import 'package:dro_health_feature/models/bagcontent.dart';
import 'package:dro_health_feature/models/product.dart';
import 'package:dro_health_feature/services/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var products = <Product>[].obs;

  final textEditingController = TextEditingController();

  final showSearchfield = false.obs;

  int get count => products.length;

  var quantity = 0.obs;

  void incrementQuantity() {
    quantity.value++;
  }

  void updateSearchField(bool isOpen) {
 showSearchfield.value = isOpen;
}


  void searchFilter(String enteredKeyword) {
    List<Product> results = [];
    if (enteredKeyword.isEmpty) {
      fetchProducts();
    }
    results = products
        .where((element) => element.productName
            .toLowerCase()
            .contains(enteredKeyword.toLowerCase()))
        .toList();

    products.value = results;
  }

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  @override
  void onClose() {
    super.onClose();
    quantity.value = 0;
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var productResponse = <Product>[];
    for (var i = 0; i < dataFromApi.length; i++) {
      productResponse.add(Product.fromMap(dataFromApi, i));
    }

    products.value = productResponse;
  }
}
