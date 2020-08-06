import 'dart:convert';

import 'package:karyasmk/constants/base_url.dart';
import 'package:karyasmk/models/models.dart';
import 'package:karyasmk/service/api_service.dart';
import 'package:flutter/foundation.dart';

//TODO:https://stackoverflow.com/questions/57571982/cant-fetch-data-api-url-json-flutter
//TODO:https://medium.com/flutter-community/flutter-essential-what-you-need-to-know-567ad25dcd8f#180b

class ProductListRepo {
  Future<List<ProductListModel>> getProductList() async {
    final response = await ApiService.api.get(BaseUrl);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      final List<ProductListModel> list = Product.fromJson(data).productList;

      // print(list.last.title);
      // debugPrint(list.last.title);
      return list;
    }
  }
}
