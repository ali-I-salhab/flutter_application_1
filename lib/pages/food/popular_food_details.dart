import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/controllers/popular_product_controller.dart';
import 'package:flutter_application_1/controllers/recommended_product_controller.dart';
import 'package:flutter_application_1/utils/app_constant.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/expandable_text_widget.dart';
import 'package:flutter_application_1/widgets/samll_text.dart';
import 'package:flutter_application_1/widgets/text_and_icon_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sizer/sizer.dart';

class PopularFoodDetails extends StatelessWidget {
  final int id;
  const PopularFoodDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PopularProductController>();
  
    Get.find<PopularProductController>().initProduct(
      Get.find<CartController>(),
      controller.popularProductList[id],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 50.h,
              width: double.infinity,

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "${AppConstants.BASE_URL}/uploads/" +
                        controller.popularProductList[id].img!,
                  ),
                  fit: BoxFit.cover,
                ),

                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      
                      Get.back();
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios),
                  ),

                  GetBuilder<PopularProductController>(
                    builder: (controller) {
                      return Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          controller.totalItems >= 1
                              ? Positioned(
                                right:3 ,
                                top: 3,
                                child: BigText(text: controller.totalItems.toString())
                              )
                              : Container(),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 38.h,

            left: 0,
            right: 0,

            child: Container(
              height: 50.h,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BigText(
                        text: controller.popularProductList[id].name,
                        size: 20,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ...List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                              );
                            }),
                          ],
                        ),
                        SmallText(text: "4.5"),
                        SmallText(text: "1278 comment "),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextAndIconWidget(
                          color: AppColors.mainBlackColor,
                          iconData: Icons.circle_sharp,
                          text: 'ali salahb',
                        ),
                        TextAndIconWidget(
                          color: AppColors.iconColor1,
                          iconData: Icons.location_on,
                          text: 'ali salahb',
                        ),
                        TextAndIconWidget(
                          color: AppColors.iconColor2,
                          iconData: Icons.timer_sharp,
                          text: 'ali salahb',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  BigText(text: "Chines side"),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandedTextWidget(
                        text: controller.popularProductList[id].description,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.buttonBackGroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.find<RecommendedProductController>().setQuantity(
                        false,
                      );
                    },
                    child: Icon(Icons.remove),
                  ),
                  SizedBox(width: 5),
                  GetBuilder<PopularProductController>(
                    builder: (controller) {
                      return Text(controller.inCartItems.toString());
                    },
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      print("object");
                      Get.find<PopularProductController>().setQuantity(
                        true,
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print("----------add to cart");
                controller.addItem(controller.popularProductList[id]);
              },
              child: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "\$ ${controller.popularProductList[id].price} | Add to Cart",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
