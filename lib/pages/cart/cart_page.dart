import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/samll_text.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 4.sp,
            left: 20.sp,
            right: 20.sp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios_new,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  size: 50.sp,
                ),
                SizedBox(width: 23.sp),
                AppIcon(
                  icon: Icons.home_sharp,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  size: 50.sp,
                ),
                AppIcon(
                  icon: Icons.arrow_back_ios_new,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  size: 50.sp,
                ),
              ],
            ),
          ),
          Positioned(
            top: 13.h,
            left: 20.sp,
            right: 20.sp,
            bottom: 0,
            child: Container(
              // color: const Color.fromRGBO(255, 193, 7, 1),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,

                child: GetBuilder<CartController>(builder: (controller){
                  return ListView.builder(
                  itemCount: controller.getitems.length,
                  itemBuilder: (context, s) {
                    return Container(
                      margin: EdgeInsets.all(7),
                      height: 10.h,
                      // color: Colors.black,
                      child: Row(
                        children: [
                          Container(
                            width: 20.w,

                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/food2.jpg"),
                              ),
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12.sp),
                            ),
                          ),
                          SizedBox(width: 12.sp),
                          Expanded(
                            child: Container(
                              // height: 12.w,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(text: "bitter orange juise"),
                                  SmallText(text: "Spicy"),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text: "12\$ ",
                                        size: 23,
                                        color: Colors.red,
                                      ),
                                      Container(
                                     
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: Icon(Icons.remove),
                                            ),
                                            SizedBox(width: 5),
                                            BigText(text: "0"),

                                            SizedBox(width: 5),
                                            GestureDetector(
                                              onTap: () {
                                                // print("object");
                                                // Get.find<PopularProductController>().setQuantity(
                                                //   true,
                                                // );
                                              },
                                              child: Icon(Icons.add),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
                })
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// how to add scroll inside stack