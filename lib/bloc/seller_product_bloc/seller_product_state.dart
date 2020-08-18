part of 'seller_product_bloc.dart';

abstract class SellerProductState extends Equatable {
  const SellerProductState();

  @override
  List<Object> get props => [];
}

class InitialSellerProductState extends SellerProductState {}

class SellerProductLoadingState extends SellerProductState {}

class SellerProductLoadedState extends SellerProductState {
  final List<SellerProductModel> sellerProduct;

  SellerProductLoadedState({this.sellerProduct});

  @override
  List<Object> get props => [sellerProduct];
}

class SellerProductFailurState extends SellerProductState {
  final msg;

  SellerProductFailurState({this.msg});

  @override
  List<Object> get props => [msg];
}
