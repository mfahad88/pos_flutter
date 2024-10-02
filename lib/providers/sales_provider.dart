import 'package:flutter/material.dart';

import '../models/Order.dart';
import '../models/Product.dart';

class SalesProvider extends ChangeNotifier{
  List<Product> products=[
    Product('Shampoo', 33, 40 , 40-33),
    Product('Apple', 5, 7, 7-5),
    Product('Shirt', 100, 200, 100-200),
    Product('Shampoo ABC', 33, 35, 35-33),
    Product('Shampoo XYZ', 33, 38, 38-33),
    Product('Shampoo ABCXYZ', 40, 45, 45-40),
  ];
  TextEditingController qty_controller=TextEditingController();
  TextEditingController item_controller=TextEditingController();

  List<Order> orders=List.empty(growable: true);

  String? _selectedItem;
  int? _selectedQty;

  String? get selectedItem => _selectedItem;

  void addItems(Order order){
    if(orders.any((element) => element.product!.name==order.product!.name,)){
      for(int i=0;i<orders.length;i++){
        if(orders[i].product!.name== order.product!.name){
          orders[i].qty = orders[i].qty! + order.qty!;
        }
      }
    }else {
      orders.add(order);
    }

    notifyListeners();
  }
  set selectedItem(String? value) {
    _selectedItem = value;
  }

  int? get selectedQty => _selectedQty;

  set selectedQty(int? value) {
    _selectedQty = value;
  }


}