import 'package:dio/dio.dart';
import 'package:karyasmk/constants/base_url.dart';
import 'package:karyasmk/models/models.dart';

class ProductListRepo {
  final Dio dio = new Dio();

  Future<List<ProductListModel>> getProductList() async {
    Response response;
    response = await dio.get(BaseUrl);

    if (response.statusCode == 200) {
      var data = response.data;
      final List<ProductListModel> list = Product.fromJson(data).productList;

      return list;
    }
    return null;
  }
}
