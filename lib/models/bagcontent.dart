
import 'package:dro_health_feature/models/product.dart';

class BagContent {
  BagContent( {required this.product,required this.totalPrice, required this.quantity,});
  final Product product;
  final int totalPrice;
  final int quantity;

}