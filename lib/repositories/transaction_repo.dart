import 'package:dio/dio.dart';
import 'package:karyasmk/constants/base_url.dart';

class TransactionRepo {
  final Dio dio = new Dio();

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
