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
    final currentState = state;

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
      if (currentState is CategoryStateLoaded) {
        final List<CategoryModel> categoryList =
            await _categoryRepo.getProductByCategory(event.endpoint);

        if (currentState.categoryList != categoryList) {
          yield CategoryStateLoaded(categoryList: []);
          yield CategoryStateLoaded(categoryList: categoryList);
        } else {
          yield CategoryStateLoaded(categoryList: currentState.categoryList);
        }
      }
    }
  }
}
