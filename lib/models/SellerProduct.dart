import 'package:equatable/equatable.dart';

class SellerProduct {
  List<SellerProductModel> sellerProductList;

  SellerProduct({this.sellerProductList});

  factory SellerProduct.fromJson(Map<String, dynamic> json) {
    return SellerProduct(
        sellerProductList: List<SellerProductModel>.from(json['product_list']
            .map((item) => SellerProductModel.fromMap(item))));
  }
}

class SellerProductModel extends Equatable {
  final String idProduct, title, thumb, category;
  final num price;

  SellerProductModel(
      {this.idProduct, this.title, this.thumb, this.category, this.price});

  @override
  List<Object> get props => [idProduct, title, thumb, category, price];

  factory SellerProductModel.fromMap(Map<String, dynamic> json) {
    return SellerProductModel(
        idProduct: json['id_product'],
        title: json['title'],
        thumb: json['thumb'],
        category: json['category'],
        price: json['price']);
  }
}
