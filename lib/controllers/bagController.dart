import 'package:dro_health_feature/models/bagcontent.dart';
import 'package:get/get.dart';

class BagController extends GetxController{
  var cart = <BagContent>[].obs;

  int get bagCount => cart.length;

  int get totalPrice => cart.fold(0, (sum, item) => sum + item.totalPrice);

  void addBagContent(BagContent bagContent){
    cart.add(bagContent);
  }
}