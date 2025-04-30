import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/controllers/popular_product_controller.dart';
import 'package:flutter_application_1/controllers/recommended_product_controller.dart';
import 'package:flutter_application_1/utils/app_constant.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class RecomendedFoodDetails extends StatelessWidget {
  final int id;
  const RecomendedFoodDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[id];
    Get.find<PopularProductController>().initProduct(
      Get.find<CartController>(),
      product,
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 90,
            leading: Container(),
            leadingWidth: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),

                GetBuilder<PopularProductController>(
                  builder: (controller) {
                    return Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        controller.totalItems >= 1
                            ? Positioned(
                              right: 3,
                              top: 3,
                              child: AppIcon(
                                icon: Icons.circle,
                                size: 20,
                                iconColor: Colors.transparent,
                                backgroundColor: AppColors.mainColor,
                              ),
                            )
                            : Container(),
                        controller.totalItems >= 1
                            ? Positioned(
                              right: 3,
                              top: 3,
                              child: BigText(
                                text: controller.totalItems.toString(),
                              ),
                            )
                            : Container(),
                      ],
                    );
                  },
                ),
              ],
            ),
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                width: double.infinity,
                // padding: EdgeInsets.only(top: 5, bottom: 10),
                child: Center(child: BigText(text: "Chines Side")),
              ),
            ),
            backgroundColor: AppColors.mainColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                fit: BoxFit.cover,
                "${AppConstants.BASE_URL}/uploads/${product.img!}",
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(12),
                  child: ExpandedTextWidget(text: product.description!),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(false);
                        },
                        child: AppIcon(
                          icon: Icons.remove,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                        ),
                      ),
                      BigText(text: "\$  x ${controller.inCartItems}"),
                      GestureDetector(
                        onTap: () {
                          print("tabe d +");
                          controller.setQuantity(true);
                        },
                        child: AppIcon(
                          icon: Icons.add,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: Icon(Icons.favorite),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addItem(product);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "\$ ${product.price}| Add to cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
