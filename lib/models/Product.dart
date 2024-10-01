class Product{
  String? name;
  double? actualPrice;
  double? sellPrice;
  double? profit;

  Product(this.name, this.actualPrice, this.sellPrice, this.profit);

  @override
  String toString() {
    return 'Product{name: $name, actualPrice: $actualPrice, sellPrice: $sellPrice, profit: $profit}';
  }
}