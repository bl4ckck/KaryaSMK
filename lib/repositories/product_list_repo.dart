import 'dart:io';

import 'package:dio/dio.dart';
import 'package:karyasmk/constants/base_url.dart';
import 'package:karyasmk/models/Category.dart';
import 'package:karyasmk/models/SellerProduct.dart';
import 'package:karyasmk/models/models.dart';

class ProductListRepo {
  final Dio dio = new Dio();

  Future<List<ProductListModel>> getProductList() async {
    Response response;
    response = await dio.get(BaseUrl + 'products');

    if (response.statusCode == 200) {
      var data = response.data;
      final List<ProductListModel> list = Product.fromJson(data).productList;

      return list;
    }
    return null;
  }

  Future<List<SellerProductModel>> getProductBySeller(String endpoint) async {
    Response response;
    response = await dio.get(BaseUrl + 'products/seller/' + endpoint);

    if (response.statusCode == 200) {
      var data = response.data;
      final List<SellerProductModel> sellerProductList =
          SellerProduct.fromJson(data).sellerProductList;

      return sellerProductList;
    }
    return null;
  }

  Future<List<CategoryModel>> getProductByCategory(String endpoint) async {
    Response response;
    response = await dio.get(BaseUrl + 'products/category/' + endpoint);

    if (response.statusCode == 200) {
      var data = response.data;
      final List<CategoryModel> categorylist =
          Category.fromJson(data).categoryList;

      return categorylist;
    }
    return null;
  }

  Future<bool> postProductRepo({
    String uid,
    title,
    description,
    category,
    File file,
    String quantity,
    price,
  }) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "uid": uid,
      "title": title,
      "quantity": quantity,
      "price": price,
      "description": description,
      "category": category,
      "file":
          await MultipartFile.fromFile(file.path.toString(), filename: fileName)
    });
    await dio.post(BaseUrl + 'products', data: formData).then((_) {
      return true;
    }).catchError((_) {
      return false;
    });

    return false;
  }
}
