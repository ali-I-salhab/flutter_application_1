class CartModel {
  // this id for cart 
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.isExist,
    this.quantity,
    this.time,
  });



  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    isExist = json['isexist'];
    time = json['time'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['isexist'] = isExist;
    data['quantity'] = quantity;
    data['time'] = time;
    data['price'] = price;
    data['img'] = img;

    return data;
  }
}

