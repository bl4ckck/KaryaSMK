import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:karyasmk/models/Transaction.dart';
import 'package:karyasmk/repositories/transaction_repo.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepo _transactionRepo;
  TransactionBloc(this._transactionRepo) : super(TransactionInitial());

  @override
  Stream<TransactionState> mapEventToState(
    TransactionEvent event,
  ) async* {
    if (event is StartPageTransactionEvent) {
      yield TransactionRefresh();
    }
    if (event is FetchTransactionEvent) {
      yield TransactionLoadingState();

      try {
        final List<TransactionModel> transaction =
            await _transactionRepo.getTransactionByUser(event.endpoint);
        yield TransactionLoadedState(transaction: transaction);
      } catch (e) {
        yield TransactionFailurState(msg: e);
      }
    }
    if (event is SellerFetchTransactionEvent) {
      yield TransactionLoadingState();

      try {
        final List<TransactionModel> transaction =
            await _transactionRepo.getTransactionBySeller(event.endpoint);
        yield TransactionLoadedState(transaction: transaction);
      } catch (e) {
        yield TransactionFailurState(msg: e);
      }
    }
    if (event is PostTransaction) {
      yield TransactionAddLoadingState();

      try {
        final post = await _transactionRepo.postTransactionRepo(
            idProduct: event.idProduct,
            price: event.price,
            qtyResult: event.qtyResult,
            quantity: event.quantity,
            title: event.title,
            uid: event.uid,
            uidSeller: event.uidSeller);

        yield TransactionAddStatusState(msg: 'success');
      } catch (_) {
        yield TransactionAddStatusState(msg: 'failed');
      }
    }
  }
}
