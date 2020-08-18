import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class InitialFetchProductEvent extends ProductListEvent {}

class PostProduct extends ProductListEvent {
  final String uid, title, description, category;
  final File file;
  final String quantity, price;

  PostProduct({
    @required this.uid,
    @required this.title,
    @required this.description,
    @required this.category,
    @required this.file,
    @required this.quantity,
    @required this.price,
  });
}
