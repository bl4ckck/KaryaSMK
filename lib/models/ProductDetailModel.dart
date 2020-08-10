import 'package:equatable/equatable.dart';

class ProductDetailModel {
  List<GetDataDetail> dataDetail;

  ProductDetailModel({this.dataDetail});

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
        dataDetail: List<GetDataDetail>.from(
            json['product_list'].map((item) => GetDataDetail.fromMap(item))));
  }
}

class GetDataDetail extends Equatable {
  final String id_product, title, thumb, category, description;
  final num price, quantity;

  GetDataDetail(
      {this.id_product,
      this.title,
      this.thumb,
      this.category,
      this.price,
      this.description,
      this.quantity});

  @override
  List<Object> get props =>
      [id_product, title, thumb, category, price, description, quantity];

  factory GetDataDetail.fromMap(Map<String, dynamic> json) {
    return GetDataDetail(
        id_product: json['id_product'],
        title: json['title'],
        thumb: json['thumb'],
        category: json['category'],
        price: json['price'],
        description: json['description'],
        quantity: json['quantity']);
  }
}
