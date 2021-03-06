import 'package:equatable/equatable.dart';

class Product {
  List<ProductListModel> productList;

  Product({this.productList});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        productList: List<ProductListModel>.from(json['product_list']
            .map((item) => ProductListModel.fromMap(item))));
  }
}

class ProductListModel extends Equatable {
  final String idProduct, title, thumb, category;
  final num price;

  ProductListModel(
      {this.idProduct, this.title, this.thumb, this.category, this.price});

  @override
  List<Object> get props => [idProduct, title, thumb, category, price];

  factory ProductListModel.fromMap(Map<String, dynamic> json) {
    return ProductListModel(
        idProduct: json['id_product'],
        title: json['title'],
        thumb: json['thumb'],
        category: json['category'],
        price: json['price']);
  }
}
