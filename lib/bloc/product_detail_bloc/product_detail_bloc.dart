import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:karyasmk/models/models.dart';
import 'package:karyasmk/repositories/product_detail_repo.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductDetailRepo _detailRepo;

  ProductDetailBloc(this._detailRepo) : super(ProductDetailInitial());

  @override
  Stream<ProductDetailState> mapEventToState(
    ProductDetailEvent event,
  ) async* {
    if (event is FetchProductDetail) {
      yield ProductDetailLoadingState();
      try {
        final List<GetDataDetail> data =
            await _detailRepo.getProduct(event.endpoint);
        yield ProductDetailLoadedState(data: data);
      } catch (e) {
        yield ProductDetailFailureState(msg: e.toString());
      }
    }
    if (event is ViewDeleteProductDetail) {
      yield ViewDeleteProductDetailLoadingState();
      try {
        final List<GetDataDetail> data =
            await _detailRepo.getProduct(event.endpoint);
        yield ViewDeleteProductDetailLoadedState(data: data);
      } catch (e) {
        yield ViewDeleteProductDetailFailureState(msg: e.toString());
      }
    }
    if (event is DeleteProductDetail) {
      yield ViewDeleteProductDetailLoadingState();
      try {
        final bool isDeleted = await _detailRepo.deleteProduct(event.endpoint);
        final List<GetDataDetail> data =
            await _detailRepo.getProduct(event.endpoint);
        yield ViewDeleteProductDetailLoadedState(data: data);
      } catch (e) {
        yield ViewDeleteProductDetailFailureState(msg: e.toString());
      }
    }
  }
}
