import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/popular_product_controller.dart';
import 'package:flutter_application_1/controllers/recommended_product_controller.dart';
import 'package:flutter_application_1/helper/router.dart';
import 'package:flutter_application_1/pages/cart/cart_page.dart';
import 'package:flutter_application_1/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import "package:flutter_application_1/helper/dependences.dart" as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  runApp(const MyApp());
}
// add doctor  rating future

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getPopularProductList();

    return Sizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          // getPages: AppRouter.routes,
          // initialRoute: "/",

          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          debugShowCheckedModeBanner: false,
          home: const CartPage(),
        );
      },
    );
  }
}

 
