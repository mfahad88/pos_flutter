import 'package:flutter/material.dart';

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
}