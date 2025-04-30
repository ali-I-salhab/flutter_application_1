import 'package:flutter_application_1/data/api/api_client.dart';
import 'package:flutter_application_1/utils/app_constant.dart';
import 'package:get/get.dart';

class RecommendeProductRepo extends GetxService{
   ApiiClient  apiiClient;
  RecommendeProductRepo({required this.apiiClient});
  Future<Response> getpopularProducrList()async{
    
    var data= await apiiClient.get(AppConstants.RECOMENDED_PRODUCT_URI);
    print(data);
   return data;
   
    

  }
 
}
// {
//   "key":"value",
//   "nested":[
//     {},{}
//   ]
// }