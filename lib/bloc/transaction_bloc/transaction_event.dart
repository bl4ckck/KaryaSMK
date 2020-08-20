part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class StartPageTransactionEvent extends TransactionEvent {}

class PostTransaction extends TransactionEvent {
  final String idProduct, title, uid, uidSeller;
  final num price, quantity, qtyResult;

  PostTransaction({
    this.idProduct,
    this.title,
    this.uid,
    this.uidSeller,
    this.price,
    this.quantity,
    this.qtyResult,
  });
}

class FetchTransactionEvent extends TransactionEvent {
  final String endpoint;
  FetchTransactionEvent(this.endpoint);
}

class SellerFetchTransactionEvent extends TransactionEvent {
  final String endpoint;
  SellerFetchTransactionEvent(this.endpoint);
}
