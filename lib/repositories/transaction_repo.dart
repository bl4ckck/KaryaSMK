import 'package:dio/dio.dart';
import 'package:karyasmk/constants/base_url.dart';
import 'package:karyasmk/models/Transaction.dart';

class TransactionRepo {
  final Dio dio = new Dio();

  Future<List<TransactionModel>> getTransactionByUser(String endpoint) async {
    Response response;
    response = await dio.get(BaseUrl + 'transaction/' + endpoint);

    if (response.statusCode == 200) {
      var data = response.data;
      final List<TransactionModel> transactionList =
          Transaction.fromJson(data).transactionList;

      return transactionList;
    }
    return null;
  }

  Future<bool> postTransactionRepo(
      {String idProduct,
      title,
      uid,
      uidSeller,
      num price,
      quantity,
      qtyResult}) async {
    await dio.post(BaseUrl + 'transaction', data: {
      "id_product": idProduct,
      "uid": uid,
      "uid_seller": uidSeller,
      "title": title,
      "quantity": quantity,
      "qty_result": qtyResult,
      "price": price
    }).then((_) {
      return true;
    }).catchError((_) {
      return false;
    });

    return false;
  }
}
