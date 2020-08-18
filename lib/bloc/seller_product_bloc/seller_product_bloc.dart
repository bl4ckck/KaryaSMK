import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:karyasmk/models/SellerProduct.dart';
import 'package:karyasmk/repositories/repository.dart';

part 'seller_product_event.dart';
part 'seller_product_state.dart';

class SellerProductBloc extends Bloc<SellerProductEvent, SellerProductState> {
  final ProductListRepo _sellerProductRepo;

  SellerProductBloc(this._sellerProductRepo)
      : super(InitialSellerProductState());

  @override
  Stream<SellerProductState> mapEventToState(
    SellerProductEvent event,
  ) async* {
    final currentState = state;

    if (event is InitialFetchSellerProductEvent) {
      try {
        if (currentState is InitialSellerProductState) {
          yield SellerProductLoadingState();
          final List<SellerProductModel> sellerProductList =
              await _sellerProductRepo.getProductBySeller(event.endpoint);
          yield SellerProductLoadedState(sellerProduct: sellerProductList);
        }
        if (currentState is SellerProductLoadedState) {
          yield SellerProductLoadedState(
              sellerProduct: currentState.sellerProduct);
        }
      } catch (e) {
        yield SellerProductFailurState(msg: e.toString());
      }
    }

    if (event is FetchSellerProductEvent) {
      yield SellerProductLoadingState();

      try {
        final List<SellerProductModel> sellerProduct =
            await _sellerProductRepo.getProductBySeller(event.endpoint);
        yield SellerProductLoadedState(sellerProduct: sellerProduct);
      } catch (e) {
        yield SellerProductFailurState(msg: e);
      }
    }
  }
}
