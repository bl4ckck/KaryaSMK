import 'package:equatable/equatable.dart';

class Category {
  List<CategoryModel> categoryList;

  Category({this.categoryList});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        categoryList: List<CategoryModel>.from(
            json['product_list'].map((item) => CategoryModel.fromMap(item))));
  }
}

class CategoryModel extends Equatable {
  final String idProduct, title, thumb, category;
  final num price;

  CategoryModel(
      {this.idProduct, this.title, this.thumb, this.category, this.price});

  @override
  List<Object> get props => [idProduct, title, thumb, category, price];

  factory CategoryModel.fromMap(Map<String, dynamic> json) {
    return CategoryModel(
        idProduct: json['id_product'],
        title: json['title'],
        thumb: json['thumb'],
        category: json['category'],
        price: json['price']);
  }
}
