part of 'seller_product_bloc.dart';

abstract class SellerProductEvent extends Equatable {
  const SellerProductEvent();

  @override
  List<Object> get props => [];
}

class InitialFetchSellerProductEvent extends SellerProductEvent {
  final String endpoint;
  InitialFetchSellerProductEvent(this.endpoint);
}

class FetchSellerProductEvent extends SellerProductEvent {
  final String endpoint;
  FetchSellerProductEvent(this.endpoint);
}
