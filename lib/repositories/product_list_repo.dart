import 'package:dio/dio.dart';
import 'package:karyasmk/constants/base_url.dart';
import 'package:karyasmk/models/Category.dart';
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
}
