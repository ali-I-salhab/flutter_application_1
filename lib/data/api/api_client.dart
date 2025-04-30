import 'package:flutter_application_1/utils/app_constant.dart';
import 'package:get/get.dart';

class ApiiClient  extends GetConnect implements GetxService{
  late String token;
  late String appBaseUrl;
  late Map<String,String> _mainheaders;

  ApiiClient({required this.appBaseUrl}){
    baseUrl=appBaseUrl;
    token=AppConstants.TOKEN;
    timeout=Duration(seconds: 30);
    _mainheaders={

      "Content-type":"application/json; charset=UTF-8",
      "Authorization":"Bearer $token"

    };

    // Future<Response> getData(String uri)async{
    //   try {
    //     Response response=await get(uri);
    //     return response;
    //   } catch (e) {
    //     return Response(statusCode: 1,statusText: e.toString());
    //   }

    // }
    
    // from GetConnsct
  }
}