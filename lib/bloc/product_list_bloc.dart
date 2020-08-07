import 'dart:async';

import 'package:karyasmk/models/ProductModel.dart';
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
    //   if (event is FetchProudct) {
    //     yield ProductListLoadingState();
    //     try {
    //       final List<ProductListModel> list =
    //           await _productListRepo.getProductList();
    //       yield ProductListStateLoaded(productList: list);
    //     } catch (e) {
    //       yield ProductListStateFailure(msg: e.toString());
    //     }
    //   }
    // }
    if (event is FetchProudct) {
      yield* _fetchProductBaru(currentState);
    }
    if (event is InitialFetchProductEvent) {
      yield* _initialEventToState(currentState);
    }
  }

  Stream<ProductListState> _fetchProductBaru(
      ProductListState currentState) async* {
    // try {
    //   if (currentState is FetchProudct) {
    //     yield ProductListLoadingState();
    //     List<ProductListModel> list = await _productListRepo.getProductList();
    //     yield ProductListStateLoaded(productList: list);
    //   }
    //   if (currentState is ProductListStateLoaded) {
    //     yield ProductListStateLoaded(productList: currentState.productList);
    //   }
    // } catch (e) {
    //   yield ProductListStateFailure(msg: e.toString());
    // }

//FIX BISA
    // try {
    //   final List<ProductListModel> list =
    //       await _productListRepo.getProductList();

    //   yield ProductListLoadingState();
    //   yield ProductListStateLoaded(productList: list);
    // } catch (e) {
    //   yield ProductListStateFailure(msg: e.toString());
    // }

    try {
      if (currentState is InitialProductListState) {
        yield ProductListLoadingState();
        final List<ProductListModel> list =
            await _productListRepo.getProductList();
        yield ProductListStateLoaded(productList: list);
      }
      if (currentState is ProductListStateLoaded) {
        final List<ProductListModel> list =
            await _productListRepo.getProductList();
        yield list.isEmpty
            ? currentState.productList
            : ProductListStateLoaded(
                productList: currentState.productList + list,
              );
      }
    } catch (e) {
      yield ProductListStateFailure(msg: e.toString());
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
