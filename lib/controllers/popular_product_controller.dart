import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/data/repository/popular_product_repo.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/models/popular_product_model.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<Products> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int get inCartItems => _inCartItems + quantity;
  // init late
  late CartController _cartController;
  Map<int,CartModel> _items={};
   Map<int,CartModel> get items =>_items;
  // we use this variable inside details page for increase decrease product quantity

  int quantity = 0;
  int _inCartItems = 0;
  Future<void> getPopularProductList() async {
 
    Response response = await popularProductRepo.getpopularProducrList();
 
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(
        Product.fromJson(response.body).products as Iterable<Products>,
      );
      update();
      _isLoaded = true;
      print(_popularProductList[0]);
    } else {}
  }

  void setQuantity(bool state) {
  
    if (state) {
      quantity = chechQuantity(quantity + 1);
      print(_inCartItems);
    } else {
       print(_inCartItems);
      quantity = chechQuantity(quantity - 1);
    }
    update();
  }

  int chechQuantity(int quantity) {
    if ((quantity+_inCartItems) < 0) {
      Get.snackbar("Error", "can't remove more");
      return 0;
    }
    if(_inCartItems>0){
    quantity=_inCartItems;
    return quantity;
    }
    if ((_inCartItems+quantity) > 10) {
      Get.snackbar("Error", "can't remove more");
      return 10;
    }
    return quantity;
  }

  void initProduct(CartController cartcontroller,Products products) {
    // we call this method from evey details page
    quantity = 0;
    _inCartItems = 0;
    _cartController = cartcontroller;
    var exist=false;
    exist=_cartController.existInCart(products);
    if(exist){
      _inCartItems=_cartController.getQuantity(products);
    }

    // get from strorage
  }

  void addItem(Products product) {
   

      _cartController.addItem(product, quantity);
      print(_cartController.items);
      quantity=0;
      _inCartItems=_cartController.getQuantity(product);
      _cartController.items.forEach((key,val){
        print("the id is" + val.id.toString() +"the quantity is "+ val.quantity.toString());
      });
 

    update();
  }
  int get totalItems{
    return _cartController.totalitems;
  }
  List<CartModel> get getItems => _cartController.getitems;
}
