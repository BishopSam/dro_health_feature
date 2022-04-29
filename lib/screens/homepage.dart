import 'package:dro_health_feature/color.dart';
import 'package:dro_health_feature/common_widgets/bag_content_tile.dart';
import 'package:dro_health_feature/common_widgets/bag_store.dart';
import 'package:dro_health_feature/common_widgets/product_card.dart';
import 'package:dro_health_feature/controllers/bagController.dart';
import 'package:dro_health_feature/controllers/controller.dart';
import 'package:dro_health_feature/screens/selectdrug.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.put(Controller());
  final bagController = Get.put(BagController());

  @override
  Widget build(BuildContext context) {
    return GetX<Controller>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            '${controller.count} item(s)',
            style: const TextStyle(
                color: Colors.black, fontFamily: proximaNova, fontSize: 18),
          ),
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: controller.showSearchfield.value
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 12),
                              prefix: IconButton(
                                onPressed: () {
                                  controller.updateSearchField(false);
                                },
                                icon: Icon(Icons.close),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          controller: controller.textEditingController,
                          onChanged: (val) => controller.searchFilter(
                              controller.textEditingController.text),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_upward)),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.sort)),
                            IconButton(
                                onPressed: () {
                                  controller.updateSearchField(true);
                                },
                                icon: const Icon(Icons.search)),
                          ],
                        ),
                        // TextField(
                        //   controller: controller.textEditingController,
                        //   onChanged: (val) => controller
                        //       .searchFilter(controller.textEditingController.text),
                        // )
                      ],
                    )),
        ),
        body: Stack(
          children: [
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: controller.count,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: controller.products[index],
                    onTap: () => Get.to(
                        () => SelectDrug(product: controller.products[index])),
                  );
                }),
            DraggableScrollableSheet(
              initialChildSize: 0.1,
              minChildSize: 0.1,
              maxChildSize: 1,
              builder: (context, scrollController) => Container(
                decoration: const BoxDecoration(
                    color: droPurple,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    )),
                height: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Container(
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                              color: droPurple,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 18.0, right: 18, bottom: 10, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Colors.white,
                                ),
                                const Text(
                                  'Bag',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontFamily: proximaNova),
                                ),
                                const Spacer(),
                                GetX<BagController>(builder: (_) {
                                  return CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Text(
                                        bagController.bagCount.toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: proximaNova),
                                      ));
                                })
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 500,
                          child: BagStore(
                            context: context,
                            controller: scrollController,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            children: [
                              const Text(
                                'Total Price',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: proximaNova,
                                    fontSize: 18),
                              ),
                              const Spacer(),
                              GetX<BagController>(builder: (_) {
                                return Text(
                                  '\$${bagController.totalPrice}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: proximaNova,
                                      fontSize: 18),
                                );
                              })
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Text(
                                'Checkout',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: proximaNova),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
