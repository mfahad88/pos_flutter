import 'package:pos_flutter/models/Product.dart';

class Order{
  Product? product;
  int? qty;

  Order(this.product, this.qty);
}