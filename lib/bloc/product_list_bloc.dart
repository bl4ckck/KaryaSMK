import 'dart:async';

import 'package:karyasmk/models/models.dart';
import 'package:karyasmk/repositories/repository.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:rxdart/rxdart.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductListRepo _productListRepo;

  ProductListBloc(this._productListRepo) : super(InitialProductListState());

  @override
  Stream<Transition<ProductListEvent, ProductListState>> transformEvents(
      Stream<ProductListEvent> events,
      TransitionFunction<ProductListEvent, ProductListState> transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }

  @override
  Stream<ProductListState> mapEventToState(
    ProductListEvent event,
  ) async* {
    final currentState = state;

    if (event is InitialFetchProductEvent) {
      yield* _initialEventToState(currentState);
    }

    if (event is PostProduct) {
      yield ProductAddLoadingState();

      try {
        await _productListRepo.postProductRepo(
            category: event.category,
            description: event.description,
            file: event.file,
            price: event.price,
            quantity: event.quantity,
            title: event.title,
            uid: event.uid);

        yield ProductAddStatusState(msg: 'success');
        final List<ProductListModel> list =
            await _productListRepo.getProductList();
        yield ProductListStateLoaded(productList: list);
      } catch (_) {
        yield ProductAddStatusState(msg: 'failed');
      }
    }
  }

  Stream<ProductListState> _initialEventToState(
      ProductListState currentState) async* {
    try {
      if (currentState is InitialProductListState) {
        yield ProductListLoadingState();
        final List<ProductListModel> list =
            await _productListRepo.getProductList();
        yield ProductListStateLoaded(productList: list);
      }
      if (currentState is ProductListStateLoaded) {
        yield ProductListStateLoaded(productList: currentState.productList);
      }
    } catch (e) {
      yield ProductListStateFailure(msg: e.toString());
    }
  }
}
