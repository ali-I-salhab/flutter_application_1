import 'package:flutter_application_1/data/api/api_client.dart';
import 'package:flutter_application_1/utils/app_constant.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{
   ApiiClient  apiiClient;
  PopularProductRepo({required this.apiiClient});
  Future<Response> getpopularProducrList()async{
    print("000000000000000000000000");
    var data= await apiiClient.get(AppConstants.POPULAR_PRODUCT_URI);
    print(data);
   return data;
   
    

  }
 
}
