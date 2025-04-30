import 'package:flutter_application_1/data/repository/cart_repo.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/models/popular_product_model.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  // int is
  final Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => items;

  void addItem(Products products, int quantity) {
    var totalQuantity=0;
    // if the key found will not add it
    _items.forEach((key, val) {
      print('quantity' + val.quantity.toString());
    });
    if (_items.containsKey(products.id)) {
      // update quantity for existing product
      _items.update(products.id!, (value) {
        totalQuantity=value.quantity!+quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          time: DateTime.now().toString(),
          isExist: true,
        );
      });
      if(totalQuantity<=0){}
      _items.remove(products.id);
    } else {
      // add new product
      if (quantity > 0) {
        _items.putIfAbsent(products.id!, () {
          print(
            'adding item to the cart with id ' +
                products.id.toString() +
                "quantity" +
                quantity.toString(),
          );

          return CartModel(
            id: products.id,
            name: products.name,
            price: products.price,
            img: products.img,
            quantity: quantity,
            time: DateTime.now().toString(),
            isExist: true,
          );
        });
      } else {
        Get.snackbar(
          "item Count",
          "you should add one item to the cart",
          backgroundColor: AppColors.mainColor,
        );
      }
    }
  }

  bool existInCart(Products products) {
    if (_items.containsKey(products.id)) {
      return true;
    }
    return false;
  }

  getQuantity(Products product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, val) {
        if (key == product.id) {
          quantity = val.quantity!;
        }
      });
    }
    return quantity;
  }
  int get totalitems {
    var totalQuantity=0;
    _items.forEach((key,val){
      totalQuantity=totalQuantity+val.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel>  get getitems{
    
   return  _items.entries.map((e){
      return e.value;
    }).toList();
   
  }
}
