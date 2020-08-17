import 'package:equatable/equatable.dart';
import 'package:karyasmk/models/models.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object> get props => [];
}

class InitialProductListState extends ProductListState {}

class ProductListLoadingState extends ProductListState {}

class ProductListStateLoaded extends ProductListState {
  final List<ProductListModel> productList;

  ProductListStateLoaded({this.productList});

  @override
  List<Object> get props => [productList];
}

class ProductListStateFailure extends ProductListState {
  final String msg;

  ProductListStateFailure({this.msg});

  @override
  List<Object> get props => [msg];
}

class ProductAddLoadingState extends ProductListState {}

class ProductAddStatusState extends ProductListState {
  final String msg;

  ProductAddStatusState({this.msg});

  @override
  List<Object> get props => [msg];
}
