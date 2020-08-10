part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoadingState extends ProductDetailState {}

class ProductDetailLoadedState extends ProductDetailState {
  final List<GetDataDetail> data;

  ProductDetailLoadedState({this.data});

  @override
  List<Object> get props => [data];
}

class ProductDetailFailureState extends ProductDetailState {
  final String msg;

  ProductDetailFailureState({this.msg});

  @override
  List<Object> get props => [msg];
}
