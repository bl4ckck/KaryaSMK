import 'package:equatable/equatable.dart';

class Transaction {
  List<TransactionModel> transactionList;

  Transaction({this.transactionList});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        transactionList: List<TransactionModel>.from(json['transaction_list']
            .map((item) => TransactionModel.fromMap(item))));
  }
}

class TransactionModel extends Equatable {
  final String idTransaction, idProduct, title, uid, uidSeller, date;
  final num price, quantity;

  TransactionModel({
    this.idTransaction,
    this.idProduct,
    this.title,
    this.uid,
    this.uidSeller,
    this.date,
    this.price,
    this.quantity,
  });

  @override
  List<Object> get props =>
      [idTransaction, idProduct, title, uid, uidSeller, date, price, quantity];

  factory TransactionModel.fromMap(Map<String, dynamic> json) {
    return TransactionModel(
        idTransaction: json['id_transaction'],
        idProduct: json['id_product'],
        title: json['title'],
        uid: json['uid'],
        uidSeller: json['uid_seller'],
        date: json['date'],
        price: json['price'],
        quantity: json['quantity']);
  }
}
