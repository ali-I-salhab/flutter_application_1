import 'package:flutter_application_1/pages/food/popular_food_details.dart';
import 'package:flutter_application_1/pages/food/recomended_food_details.dart';
import 'package:flutter_application_1/pages/home/main_food_page.dart';
import 'package:get/route_manager.dart';

class AppRouter {
  static const String main_food_page = "/";
  static const String popular_food_page = "/popular";
  static const String recommended_food_page = "/recommende";
  static String getPopularFoodPage(int id) => "$popular_food_page?id=$id";
    static String getRecommendedFoodPage(int id) => "$recommended_food_page?id=$id";

  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: main_food_page,
      page: () {
        return MainFoodPage();
      },
    ),
    GetPage(
      name: popular_food_page,
      page: () {
        String id = Get.parameters['id']!;
        return PopularFoodDetails(id: int.parse(id));
      },
    ),
    GetPage(
      name: recommended_food_page,
      page: () {
         String id = Get.parameters['id']!;
        return RecomendedFoodDetails(id: int.parse(id),);
      },
    ),
  ];
}
