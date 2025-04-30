import 'package:flutter_application_1/data/repository/recomended_product_repo.dart';
import 'package:flutter_application_1/models/popular_product_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController{
  final RecommendeProductRepo recomendedProductRepo;
  RecommendedProductController({required this.recomendedProductRepo});
  List<Products> _recommendedProductList=[];
   List<Products> get recommendedProductList => _recommendedProductList;
   bool _isLoaded=false;
   bool get  isLoaded  => _isLoaded;
   int quantity=0;

  Future<void> getPopularProductList()async{
    print("============================recomended===");
    Response response=await recomendedProductRepo.getpopularProducrList();
   
    if (response.statusCode==200) {
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products as Iterable<Products> );
      update();
      _isLoaded=true;
      print(_recommendedProductList[0]);
      
    }else{}

  }
  void setQuantity(bool state){
    if(state){
      quantity= chechQuantity(quantity+1);
    }else{
      quantity=chechQuantity(quantity-1);
    }
    update();
  }
  int chechQuantity(int quantity){
    if(quantity<=0){
    Get.snackbar("Error", "can't remove more");
    return 0;}
    if(quantity > 10){
     
    Get.snackbar("Error", "can't remove more");
        return 10;


    }
    return quantity;
  }
}