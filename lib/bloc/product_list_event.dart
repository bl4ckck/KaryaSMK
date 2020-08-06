import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class FetchProudct extends ProductListEvent {}

class InitialFetchProductEvent extends ProductListEvent {}

class RefreshProductEvent extends ProductListEvent {}
