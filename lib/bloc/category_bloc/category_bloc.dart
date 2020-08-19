import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:karyasmk/models/Category.dart';
import 'package:karyasmk/repositories/repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ProductListRepo _categoryRepo;

  CategoryBloc(this._categoryRepo) : super(InitialCategoryState());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is InitialFetchCategoryEvent) {
      try {
        yield CategoryLoadingState();
        final List<CategoryModel> categoryList =
            await _categoryRepo.getProductByCategory(event.endpoint);
        yield CategoryStateLoaded(categoryList: categoryList);
      } catch (e) {
        yield CategoryStateFailure(msg: e.toString());
      }
    }

    if (event is PushCategoryEvent) {
      yield CategoryLoadingState();
      try {
        final List<CategoryModel> categoryList =
            await _categoryRepo.getProductByCategory(event.endpoint);
        yield CategoryStateLoaded(categoryList: categoryList);
      } catch (e) {
        yield CategoryStateFailure(msg: e.toString());
      }
    }
  }
}
