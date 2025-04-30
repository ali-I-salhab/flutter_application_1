import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/popular_product_controller.dart';
import 'package:flutter_application_1/controllers/recommended_product_controller.dart';
import 'package:flutter_application_1/helper/router.dart';
import 'package:flutter_application_1/models/popular_product_model.dart';
import 'package:flutter_application_1/utils/app_constant.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/samll_text.dart';
import 'package:flutter_application_1/widgets/text_and_icon_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final PageController _controller = PageController(viewportFraction: 0.9);
  var currPageValue = 0.0;
  double scalevactor = 0.8;
  double hieght = 220;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currPageValue = _controller.page!;
      });
    });
  }

  @override
  void dispose() {
    // print("dispose controller listeneer ");
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(
          builder: (controller) {
            return controller.isLoaded
                ? SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: controller.popularProductList.length,
                    itemBuilder: (context, index) {
                      return _buildPageItem(
                        index,
                        controller.popularProductList[index],
                      );
                    },
                  ),
                )
                : CircularProgressIndicator();
          },
        ),
        GetBuilder<PopularProductController>(
          builder: (controller) {
            return DotsIndicator(
              dotsCount:
                  controller.popularProductList.isEmpty
                      ? 1
                      : controller.popularProductList.length,
              position: currPageValue,
              decorator: DotsDecorator(
                activeColor: AppColors.mainColor,
                size: Size.square(9),
                activeSize: Size(18, 9),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: 10),
              Container(
                margin: EdgeInsets.only(bottom: 3),

                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: 10),
              SmallText(text: "food pairing"),
            ],
          ),
        ),
        SizedBox(height: 12),
        GetBuilder<RecommendedProductController>(
          builder: (rcontroller) {
            return rcontroller.isLoaded
                ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  itemCount: rcontroller.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRouter.getRecommendedFoodPage(index));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 10.sp,
                                right: 20.sp,
                              ),
                              height: 10.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black12,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "${AppConstants.BASE_URL}/uploads/${rcontroller
                                            .recommendedProductList[index]
                                            .img!}",
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(
                                    text:
                                        rcontroller
                                            .recommendedProductList[index]
                                            .name!,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                    child: SmallText(
                                      text:
                                          rcontroller
                                              .recommendedProductList[index]
                                              .description!,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextAndIconWidget(
                                        iconData: Icons.circle_sharp,
                                        color: AppColors.mainBlackColor,
                                        text: "text",
                                      ),
                                      TextAndIconWidget(
                                        iconData: Icons.location_on,
                                        color: AppColors.iconColor1,
                                        text: "text",
                                      ),
                                      TextAndIconWidget(
                                        iconData: Icons.timer_outlined,
                                        color: AppColors.iconColor2,
                                        text: "text",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
                : CircularProgressIndicator(color: AppColors.mainColor);
          },
        ),
      ],
    );
  }

  // when we put container inside another conatainer the child take size from the parent
  // constaints go dowwn size go up parent set position
  Widget _buildPageItem(int index, Products product) {
    Matrix4 matrix4 = Matrix4.identity();
    if (currPageValue.floor() == index) {
      // print("=====================================");
      var currScale = 1 - (currPageValue - index) * (1 - scalevactor);
      var currTrans = hieght * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() + 1) {
      var currScale =
          scalevactor + (currPageValue - index + 1) * (1 - scalevactor);
      var currTrans = hieght * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() - 1) {
      var currScale = 1 - (currPageValue - index) * (1 - scalevactor);

      var currTrans = hieght * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, hieght * (1 - scalevactor) / 2, 0);
    }
    return GestureDetector(
      onTap: () {
        print(index);
        Get.toNamed(AppRouter.getPopularFoodPage(index));
      },
      child: Transform(
        transform: matrix4,
        child: Stack(
          children: [
            Container(
              height: 200,
              margin: EdgeInsets.only(left: 10, right: 10),

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "${AppConstants.BASE_URL}/uploads/${product.img!}",
                  ),
                  fit: BoxFit.cover,
                ),
                color:
                    index.isEven
                        ? const Color.fromARGB(255, 106, 190, 109)
                        : const Color.fromARGB(255, 152, 130, 65),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.only(left: 12, top: 4),
                margin: EdgeInsets.only(top: 80),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffe8e8e8),
                      offset: Offset(0, 5),
                      spreadRadius: 0.1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                width: 320,
                height: 110,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: BigText(text: product.name!, size: 20)),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
