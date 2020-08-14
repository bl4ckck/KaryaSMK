part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class InitialCategoryState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryStateLoaded extends CategoryState {
  final List<CategoryModel> categoryList;

  CategoryStateLoaded({this.categoryList});

  @override
  List<Object> get props => [categoryList];
}

class CategoryStateFailure extends CategoryState {
  final String msg;

  CategoryStateFailure({this.msg});

  @override
  List<Object> get props => [msg];
}
