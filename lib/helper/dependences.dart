import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/controllers/popular_product_controller.dart';
import 'package:flutter_application_1/controllers/recommended_product_controller.dart';
import 'package:flutter_application_1/data/api/api_client.dart';
import 'package:flutter_application_1/data/repository/cart_repo.dart';
import 'package:flutter_application_1/data/repository/popular_product_repo.dart';
import 'package:flutter_application_1/data/repository/recomended_product_repo.dart';
import 'package:flutter_application_1/utils/app_constant.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // api
  Get.lazyPut(() => ApiiClient(appBaseUrl: AppConstants.BASE_URL));

  //
  Get.lazyPut(() => PopularProductRepo(apiiClient: Get.find()));
  Get.lazyPut(() => RecommendeProductRepo(apiiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  // controller
Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()), fenix: true);
Get.lazyPut(() => RecommendedProductController(recomendedProductRepo: Get.find()), fenix: true);
Get.lazyPut(() => CartController(cartRepo: Get.find()), fenix: true);
}
