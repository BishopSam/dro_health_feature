import 'package:get/get.dart';

class Product {
  Product(
      {this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productWeight,
      this.productDesc = '',
      this.productSubDesc ='',
      this.productID,
      this.productPackSize = '',
      this.dispensedIn = '',
      this.productQuantity = 0,
      this.productSeller = ''});
  final String? productImage;
  final String productName;
  final int productPrice;
  final int productQuantity;
  //mg
  final int productWeight;
  final String productDesc;
  final String productSubDesc;
  final String?productID;
  final String productPackSize;
  final String dispensedIn;
  final String productSeller;

  factory Product.fromMap(List<Map<String, dynamic>> data, int index) {
    final dataFromMap = data[index];
    return Product(
        productName: dataFromMap['productName'],
        productPrice: dataFromMap['productPrice'],
        productWeight: dataFromMap['productWeight'],
        productDesc: dataFromMap['productDesc'],
        productImage: dataFromMap['productImage'],
        productID: dataFromMap['productID'],
        productPackSize: dataFromMap['packSize'],
        productSubDesc: dataFromMap['productSubDesc'],
        productSeller: dataFromMap['seller'],
        dispensedIn: dataFromMap['dispensedIn'],
        productQuantity: dataFromMap['quantity']);
  }

  
}
