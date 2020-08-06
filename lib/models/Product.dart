import 'package:equatable/equatable.dart';

// "product_list": [
//         {
//             "id_product": "123"
//             "title": "Sepeda Listrik Mars Platinum",
//             "thumb": "https://ecs7.tokopedia.net/img/cache/700/product-1/2020/3/16/7982612/7982612_9a820600-5f96-4b4e-b2ec-23e30297b753_960_960.jpg",
//             "category": "Otomotive",
//             "price": "5100000"

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
  final String id_product, title, thumb, category, price;

  ProductListModel(
      {this.id_product, this.title, this.thumb, this.category, this.price});

  @override
  List<Object> get props => [id_product, title, thumb, category, price];

  factory ProductListModel.fromMap(Map<String, dynamic> json) {
    return ProductListModel(
        id_product: json['id_product'],
        title: json['title'],
        thumb: json['thumb'],
        category: json['category'],
        price: json['price']);
  }
}
