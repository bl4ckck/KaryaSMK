import 'package:dio/dio.dart';
import 'package:karyasmk/constants/base_url.dart';
import 'package:karyasmk/models/models.dart';

class ProductDetailRepo {
  final Dio dio = new Dio();

  Future<List<GetDataDetail>> getProduct(String endpoint) async {
    Response response;
    response = await dio.get(BaseUrl + 'products/' + endpoint);

    if (response.statusCode == 200) {
      var data = response.data;
      final List<GetDataDetail> list =
          ProductDetailModel.fromJson(data).dataDetail;

      return list;
    }
    return null;
  }
}
